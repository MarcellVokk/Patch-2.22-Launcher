﻿using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Security.Principal;
using LauncherGUI.Logic;

namespace LauncherGUI.Pages.Subpages.Settings.Launcher
{
    public partial class Settings_Bfme2General : UserControl
    {
        private bool _isNotUserInteractionForLanguageDropDown = true;

        public Settings_Bfme2General()
        {
            InitializeComponent();

            BfmeRegistryManager.EnsureBfmeAppRegistry(1);
            BfmeSettingsManager.EnsureOptionsFile(1);

            InitializeWindowElements();
        }

        private void InitializeWindowElements()
        {
            ComboBoxResolution.ItemsSource = SystemDisplayManager.GetAllSupportedResolutions();
            ComboBoxResolution.SelectedItem = !string.IsNullOrEmpty(Properties.Settings.Default.BFME2ResolutionSetting) ? Properties.Settings.Default.BFME2ResolutionSetting : ComboBoxResolution.Items[^1];
            ComboBoxLanguage.SelectedIndex = Properties.Settings.Default.BFME2LanguageSetting != 0 ? Properties.Settings.Default.BFME2LanguageSetting : 0;

            string cdKey = BfmeRegistryManager.GetBfmeSerialKey(1);
            TextBoxCDKey.Text = string.Join("-", Enumerable.Range(0, cdKey.Length / 4).Select(i => cdKey.Substring(i * 4, 4)));

            if (LauncherStateManager.IsElevated)
                ButtonChangeCdKey.Content = Application.Current.FindResource("SettingsBFMEGeneralCDKeyButtonTextGenerate");
        }

        private void ComboBoxLanguage_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (_isNotUserInteractionForLanguageDropDown)
            {
                _isNotUserInteractionForLanguageDropDown = false;
                return;
            }

            SaveLanguageSettings();
        }

        private void ComboBoxResolution_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SaveResolutionSettings();
        }

        private void SaveLanguageSettings()
        {
            Properties.Settings.Default.BFME2LanguageSetting = ComboBoxLanguage.SelectedIndex;
            Properties.Settings.Default.Save();
        }

        private void SaveResolutionSettings()
        {
            Properties.Settings.Default.BFME2ResolutionSetting = ComboBoxResolution.SelectedItem?.ToString();
            BfmeSettingsManager.Set(1, "Resolution", ComboBoxResolution.SelectedValue?.ToString() ?? string.Empty);
            Properties.Settings.Default.Save();
        }

        private void ButtonChangeCdKey_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            LauncherStateManager.AsElevated(() =>
            {
                BfmeRegistryManager.EnsureBfmeAppRegistry(1);
                string cdKey = BfmeRegistryManager.GetBfmeSerialKey(1);
                TextBoxCDKey.Text = string.Join("-", Enumerable.Range(0, cdKey.Length / 4).Select(i => cdKey.Substring(i * 4, 4)));
            });
        }
    }
}