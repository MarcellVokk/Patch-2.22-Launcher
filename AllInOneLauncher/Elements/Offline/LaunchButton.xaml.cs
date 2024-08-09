﻿using AllInOneLauncher.Logic;
using BfmeWorkshopKit.Logic;
using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Media.Animation;

namespace AllInOneLauncher.Elements
{
    /// <summary>
    /// Interaction logic for LaunchButton.xaml
    /// </summary>
    public partial class LaunchButton : UserControl
    {
        public LaunchButton()
        {
            InitializeComponent();

            BfmeWorkshopSyncManager.OnSyncBegin += OnSyncBegin;
            BfmeWorkshopSyncManager.OnSyncUpdate += OnSyncUpdate;
            BfmeWorkshopSyncManager.OnSyncEnd += OnSyncEnd;
        }

        private void OnSyncBegin(BfmeWorkshopKit.Data.BfmeWorkshopEntry entry)
        {
            IsLoading = true;
            Dispatcher.Invoke(() =>
            {
                LoadStatus = $"Switching to {entry.Name}";
                ButtonState = _buttonState;
            });
        }

        private void OnSyncUpdate(int progress)
        {
            Dispatcher.Invoke(() => LoadProgress = progress);
        }

        private void OnSyncEnd()
        {
            IsLoading = false;
            Dispatcher.Invoke(() => ButtonState = _buttonState);
        }

        public event EventHandler? OnLaunchClicked;
        public event EventHandler? OnInstallClicked;

        private LaunchButtonState _buttonState = LaunchButtonState.Launch;
        public LaunchButtonState ButtonState
        {
            get => _buttonState;
            set
            {
                _buttonState = value;

                if (IsLoading)
                {
                    text.Text = "";
                    LoadStatus = Application.Current.FindResource("MainLauncherLoading").ToString()!;
                    button.Opacity = 0.4d;
                    button.IsHitTestVisible = false;
                    LoadProgress = 0;
                    progressIndication.Visibility = Visibility.Visible;
                    IconUAC.Visibility = Visibility.Collapsed;
                }
                else if (value == LaunchButtonState.Launch)
                {
                    text.Text = Application.Current.FindResource("MainLauncherPlay").ToString()!;
                    button.Opacity = 1d;
                    button.IsHitTestVisible = true;
                    LoadProgress = 0;
                    progressIndication.Visibility = Visibility.Collapsed;
                    IconUAC.Visibility = Visibility.Collapsed;
                }
                else if (value == LaunchButtonState.Install)
                {
                    text.Text = Application.Current.FindResource("MainLauncherInstall").ToString()!;
                    button.Opacity = 1d;
                    button.IsHitTestVisible = true;
                    LoadProgress = 0;
                    progressIndication.Visibility = Visibility.Collapsed;
                    IconUAC.Visibility = LauncherStateManager.IsElevated ? Visibility.Collapsed : Visibility.Visible;
                }
            }
        }

        private bool IsLoading = false;

        public double LoadProgress
        {
            get => (double)GetValue(LoadProgressProperty);
            set
            {
                SetValue(LoadProgressProperty, value);
                progressText.Text = $"{value}%";
            }
        }
        public static readonly DependencyProperty LoadProgressProperty = DependencyProperty.Register("LoadProgress", typeof(double), typeof(LaunchButton), new PropertyMetadata(OnLoadProgressChangedCallBack));
        private static void OnLoadProgressChangedCallBack(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            LaunchButton progressBar = (LaunchButton)sender;
            if (progressBar != null)
            {
                DoubleAnimation da = new() { To = (double)e.NewValue / 100d, Duration = TimeSpan.FromSeconds((double)e.NewValue == 0d ? 0d : 0.5d) };
                progressBar.progressGradientStop1.BeginAnimation(GradientStop.OffsetProperty, da, HandoffBehavior.Compose);
                progressBar.progressGradientStop2.BeginAnimation(GradientStop.OffsetProperty, da, HandoffBehavior.Compose);
            }
        }

        public string LoadStatus
        {
            get => statusText.Text;
            set => statusText.Text = value;
        }

        private void OnClicked(object sender, RoutedEventArgs e)
        {
            if (ButtonState == LaunchButtonState.Launch)
                OnLaunchClicked?.Invoke(this, EventArgs.Empty);
            else if (ButtonState == LaunchButtonState.Install)
                OnInstallClicked?.Invoke(this, EventArgs.Empty);
        }
    }

    public enum LaunchButtonState
    {
        Launch,
        Install
    }
}
