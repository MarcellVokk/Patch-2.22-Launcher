﻿using BfmeFoundationProject.WorkshopKit.Data;
using BfmeFoundationProject.WorkshopKit.Logic;
using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Threading.Tasks;
using System.Windows.Media.Animation;
using BfmeFoundationProject.BfmeRegistryManagement;

namespace AllInOneLauncher.Elements
{
    /// <summary>
    /// Interaction logic for LibraryTileHorizontal.xaml
    /// </summary>
    public partial class LibraryTileHorizontal : UserControl
    {
        public LibraryTileHorizontal()
        {
            InitializeComponent();
            Properties.Settings.Default.SettingsSaving += (s, e) => UpdateType();

            _ = Task.Run(async () =>
            {
                while (true)
                {
                    if (titleStack.ActualWidth <= availableTitleArea.ActualWidth)
                    {
                        Dispatcher.Invoke(() =>
                        {
                            titleStack.BeginAnimation(MarginProperty, null);
                            titleStack.SetValue(MarginProperty, new Thickness(0));
                        });
                        await Task.Delay(TimeSpan.FromSeconds(2));
                        continue;
                    }

                    var duration = TimeSpan.FromSeconds((titleStack.ActualWidth - availableTitleArea.ActualWidth) * 0.05);

                    Dispatcher.Invoke(() =>
                    {
                        ThicknessAnimation l = new() { To = new Thickness(availableTitleArea.ActualWidth - titleStack.ActualWidth, 0, 0, 0), Duration = duration };
                        Dispatcher.Invoke(() => titleStack.BeginAnimation(MarginProperty, l));
                    });
                    await Task.Delay(duration.Add(TimeSpan.FromSeconds(2)));

                    if (titleStack.ActualWidth <= availableTitleArea.ActualWidth)
                    {
                        Dispatcher.Invoke(() =>
                        {
                            titleStack.BeginAnimation(MarginProperty, null);
                            titleStack.SetValue(MarginProperty, new Thickness(0));
                        });
                        await Task.Delay(TimeSpan.FromSeconds(2));
                        continue;
                    }

                    Dispatcher.Invoke(() =>
                    {
                        ThicknessAnimation r = new() { To = new Thickness(0, 0, 0, 0), Duration = duration };
                        Dispatcher.Invoke(() => titleStack.BeginAnimation(MarginProperty, r));
                    });
                    await Task.Delay(duration.Add(TimeSpan.FromSeconds(2)));
                }
            });
        }

        BfmeWorkshopEntry? _workshopEntry = null;
        public BfmeWorkshopEntry? WorkshopEntry
        {
            get => _workshopEntry;
            set
            {
                _workshopEntry = value;

                if (value == null)
                {
                    activeEntry.Visibility = Visibility.Hidden;
                    activeEntryNullIndicator.Visibility = Visibility.Visible;
                    return;
                }
                else
                {
                    activeEntry.Visibility = Visibility.Visible;
                    activeEntryNullIndicator.Visibility = Visibility.Hidden;
                }

                activeEntryIcon.Source = null;
                activeEntryTitle.Text = value.Value.Name;
                activeEntryVersion.Text = value.Value.Version;
                activeEntryAuthor.Text = value.Value.Author;
                UpdateType();

                activeEntryLoading.Visibility = IsLoading ? Visibility.Visible : Visibility.Hidden;
                activeEntryActive.Visibility = IsLoading ? Visibility.Hidden : Visibility.Visible;
                activeEntryReloadButton.Visibility = IsLoading ? Visibility.Hidden : Visibility.Visible;

                IsHitTestVisible = BfmeRegistryManager.IsInstalled(value.Value.Game);
                activeEntry.Opacity = IsHitTestVisible ? 1 : 0.5;
                if (IsHitTestVisible)
                    try { activeEntryIcon.Source = new BitmapImage(new Uri(value.Value.ArtworkUrl)); } catch { }
                else
                    try { activeEntryIcon.Source = new FormatConvertedBitmap(new BitmapImage(new Uri(value.Value.ArtworkUrl)), PixelFormats.Gray16, BitmapPalettes.Gray16, 1); } catch { }
            }
        }

        private bool isLoading = false;
        public bool IsLoading
        {
            get => isLoading;
            set
            {
                isLoading = value;

                activeEntryLoading.Visibility = value ? Visibility.Visible : Visibility.Hidden;
                loadingSpinner.IsLoading = value;
                activeEntryActive.Visibility = value ? Visibility.Hidden : Visibility.Visible;
                activeEntryReloadButton.Visibility = value ? Visibility.Hidden : Visibility.Visible;
            }
        }

        private void UpdateType()
        {
            if (WorkshopEntry == null)
                return;

            if (WorkshopEntry.Value.Type == 0)
                entryType.Text = Application.Current.FindResource("LibraryTilePatchType").ToString()!;
            else if (WorkshopEntry.Value.Type == 1)
                entryType.Text = Application.Current.FindResource("LibraryTileModType").ToString()!;
            else if (WorkshopEntry.Value.Type == 2)
                entryType.Text = Application.Current.FindResource("LibraryTileEnhancementType").ToString()!;
            else if (WorkshopEntry.Value.Type == 3)
                entryType.Text = Application.Current.FindResource("LibraryTileMapPackType").ToString()!;
            else if (WorkshopEntry.Value.Type == 4)
                entryType.Text = Application.Current.FindResource("LibraryTileSnapshotType").ToString()!;
        }

        private async void OnResyncActiveEntry(object sender, RoutedEventArgs e)
        {
            if (WorkshopEntry != null)
            {
                WorkshopEntry = BfmeWorkshopSyncManager.GetActivePatch(WorkshopEntry!.Value.Game);
                IsLoading = false;
            }

            if (WorkshopEntry != null)
                await BfmeWorkshopSyncManager.Sync(WorkshopEntry!.Value, (progress) => { }, (downloadItem, downloadProgress) => { });
        }
    }
}
