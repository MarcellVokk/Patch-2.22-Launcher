﻿using BfmeFoundationProject.WorkshopKit.Data;
using BfmeFoundationProject.WorkshopKit.Logic;
using AllInOneLauncher.Elements;
using System;
using System.Windows;
using System.Windows.Controls;
using System.Collections.Generic;

namespace AllInOneLauncher.Pages.Subpages.Offline
{
    /// <summary>
    /// Interaction logic for Offline_Workshop.xaml
    /// </summary>
    public partial class Offline_Workshop : UserControl
    {
        public Offline_Workshop()
        {
            InitializeComponent();
            typeFilter.Options = ["{WorkshopPageFilterPatchesAndMods}", "{WorkshopPageFilterEnhancements}", "{WorkshopPageFilterEverything}"];
            searchFilter.Options = ["{WorkshopPageSortByMostDownloads}", "{WorkshopPageSortByMostRecent}", "{WorkshopPageSortAlphabetical}"];
        }

        private int Game = 0;

        public void Load(int game)
        {
            Game = game;
            search.Text = "";

            UpdateQuery();
        }

        private async void UpdateQuery()
        {
            try
            {
                workshopContent.Visibility = Visibility.Visible;
                noConnection.Visibility = Visibility.Hidden;

                workshopTiles.Children.Clear();
                List<BfmeWorkshopEntry> entries = await BfmeWorkshopQueryManager.Query(game: Game, keyword: search.Text, type: typeFilter.Selected == 0 ? -2 : (typeFilter.Selected == 1 ? -3 : -1), sortMode: searchFilter.Selected);
                workshopTiles.Children.Clear();
                foreach (BfmeWorkshopEntry entry in entries)
                    workshopTiles.Children.Add(new WorkshopTile() { WorkshopEntry = entry, Margin = new Thickness(0, 0, 10, 10) });
            }
            catch
            {
                workshopContent.Visibility = Visibility.Hidden;
                noConnection.Visibility = Visibility.Visible;
            }
        }

        private void OnReloadClicked(object sender, RoutedEventArgs e) => UpdateQuery();

        private void OnFilterChanged(object sender, EventArgs e) => UpdateQuery();

        private void OnSearchTextChanged(object sender, TextChangedEventArgs e)
        {
            searchPlaceholder.Visibility = search.Text == "" ? Visibility.Visible : Visibility.Hidden;
            UpdateQuery();
        }
    }
}
