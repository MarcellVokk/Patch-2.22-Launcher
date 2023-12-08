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
    /// Interaction logic for HTab.xaml
    /// </summary>
    public partial class HTab : UserControl
    {
        public HTab()
        {
            InitializeComponent();
        }

        public HTabs Owner { get; set; }

        public ImageSource Icon
        {
            get => icon.Source;
            set => icon.Source = value;
        }

        private bool _selected = false;
        public bool Selected
        {
            get => _selected;
            set
            {
                _selected = value;

                if (value)
                {
                    background.Opacity = 1;
                    indicator.Opacity = 1;

                    hoverBackground.Opacity = 0;
                }
                else
                {
                    background.Opacity = 0;
                    indicator.Opacity = 0;
                }
            }
        }

        private void OnClicked(object sender, MouseButtonEventArgs e)
        {
            Owner.SelectedIndex = Owner.tabs.Children.IndexOf(this);
        }

        private void OnMouseEntered(object sender, MouseEventArgs e)
        {
            if (!Selected)
                hoverBackground.Opacity = 1;
        }

        private void OnMouseLeft(object sender, MouseEventArgs e)
        {
            hoverBackground.Opacity = 0;
        }
    }
}
