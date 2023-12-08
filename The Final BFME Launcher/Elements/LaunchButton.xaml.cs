﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace The_Final_BFME_Launcher.Elements
{
    /// <summary>
    /// Interaction logic for LaunchButton.xaml
    /// </summary>
    public partial class LaunchButton : UserControl
    {
        RectangleGeometry ProgressFillClip = new RectangleGeometry() { Rect = new Rect(0, 0, 0, 0) };

        public LaunchButton()
        {
            InitializeComponent();
            progress.Clip = ProgressFillClip;
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

                if(value == LaunchButtonState.Launch)
                {
                    button.Content = "PLAY";
                    button.Opacity = 1d;
                    button.IsHitTestVisible = true;
                }
                else if (value == LaunchButtonState.Install)
                {
                    button.Content = "INSTALL";
                    button.Opacity = 1d;
                    button.IsHitTestVisible = true;
                }
                else if (value == LaunchButtonState.Loading)
                {
                    button.Content = "";
                    LoadStatus = "Loading";
                    button.Opacity = 0.4d;
                    button.IsHitTestVisible = false;
                    LoadProgress = 0;
                }
            }
        }

        public double LoadProgress
        {
            get => (double)GetValue(ProgressProperty);
            set => SetValue(ProgressProperty, value);
        }
        public static readonly DependencyProperty ProgressProperty = DependencyProperty.Register("DownloadProgress", typeof(double), typeof(LaunchButton), new PropertyMetadata(OnDownloadProgressChangedCallBack));
        private static void OnDownloadProgressChangedCallBack(DependencyObject sender, DependencyPropertyChangedEventArgs e)
        {
            LaunchButton progressBar = (LaunchButton)sender;
            if (progressBar != null && progressBar.ButtonState == LaunchButtonState.Loading)
            {
                RectAnimation b = new RectAnimation { From = new Rect(0, 0, progressBar.ProgressFillClip.Rect.Width, progressBar.background.ActualHeight), To = new Rect(0, 0, progressBar.background.ActualWidth * ((double)e.NewValue / 100), progressBar.background.ActualHeight), Duration = TimeSpan.FromSeconds((double)e.NewValue == 0d ? 0d : 0.5d) };
                progressBar.ProgressFillClip.BeginAnimation(RectangleGeometry.RectProperty, b, HandoffBehavior.Compose);
                progressBar.progressText.Text = $"{(double)e.NewValue}%";
            }
        }

        public string LoadStatus
        {
            get => statusText.Text;
            set => statusText.Text = value;
        }

        private void progress_SizeChanged(object sender, SizeChangedEventArgs e) => ProgressFillClip.Rect = new Rect(0, 0, ProgressFillClip.Rect.Width, e.NewSize.Height);

        private void OnClicked(object sender, RoutedEventArgs e)
        {
            if (ButtonState == LaunchButtonState.Launch)
                OnLaunchClicked?.Invoke(this, EventArgs.Empty);
            else if(ButtonState == LaunchButtonState.Install)
                OnInstallClicked?.Invoke(this, EventArgs.Empty);
        }
    }

    public enum LaunchButtonState
    {
        Launch,
        Install,
        Loading
    }
}
