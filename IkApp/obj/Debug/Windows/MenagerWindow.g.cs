﻿#pragma checksum "..\..\..\Windows\MenagerWindow.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "4DDB0FA7802B27C937F9227509570F642593789730C5C858AC4E9C4F94D5BAC8"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using IkApp.Windows;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace IkApp.Windows {
    
    
    /// <summary>
    /// MenagerWindow
    /// </summary>
    public partial class MenagerWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 17 "..\..\..\Windows\MenagerWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid datagridkniga;
        
        #line default
        #line hidden
        
        
        #line 33 "..\..\..\Windows\MenagerWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button Add;
        
        #line default
        #line hidden
        
        
        #line 34 "..\..\..\Windows\MenagerWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button Edit;
        
        #line default
        #line hidden
        
        
        #line 35 "..\..\..\Windows\MenagerWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button Refresh;
        
        #line default
        #line hidden
        
        
        #line 36 "..\..\..\Windows\MenagerWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button Exit;
        
        #line default
        #line hidden
        
        
        #line 46 "..\..\..\Windows\MenagerWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid datagridbron;
        
        #line default
        #line hidden
        
        
        #line 57 "..\..\..\Windows\MenagerWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button Edit2;
        
        #line default
        #line hidden
        
        
        #line 58 "..\..\..\Windows\MenagerWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button Refresh2;
        
        #line default
        #line hidden
        
        
        #line 59 "..\..\..\Windows\MenagerWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button Exit2;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/IkApp;component/windows/menagerwindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Windows\MenagerWindow.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.datagridkniga = ((System.Windows.Controls.DataGrid)(target));
            return;
            case 2:
            this.Add = ((System.Windows.Controls.Button)(target));
            
            #line 33 "..\..\..\Windows\MenagerWindow.xaml"
            this.Add.Click += new System.Windows.RoutedEventHandler(this.Add_Click);
            
            #line default
            #line hidden
            return;
            case 3:
            this.Edit = ((System.Windows.Controls.Button)(target));
            
            #line 34 "..\..\..\Windows\MenagerWindow.xaml"
            this.Edit.Click += new System.Windows.RoutedEventHandler(this.Edit_Click);
            
            #line default
            #line hidden
            return;
            case 4:
            this.Refresh = ((System.Windows.Controls.Button)(target));
            
            #line 35 "..\..\..\Windows\MenagerWindow.xaml"
            this.Refresh.Click += new System.Windows.RoutedEventHandler(this.Refresh_Click);
            
            #line default
            #line hidden
            return;
            case 5:
            this.Exit = ((System.Windows.Controls.Button)(target));
            
            #line 36 "..\..\..\Windows\MenagerWindow.xaml"
            this.Exit.Click += new System.Windows.RoutedEventHandler(this.Exit_Click);
            
            #line default
            #line hidden
            return;
            case 6:
            this.datagridbron = ((System.Windows.Controls.DataGrid)(target));
            return;
            case 7:
            this.Edit2 = ((System.Windows.Controls.Button)(target));
            
            #line 57 "..\..\..\Windows\MenagerWindow.xaml"
            this.Edit2.Click += new System.Windows.RoutedEventHandler(this.Edit2_Click);
            
            #line default
            #line hidden
            return;
            case 8:
            this.Refresh2 = ((System.Windows.Controls.Button)(target));
            
            #line 58 "..\..\..\Windows\MenagerWindow.xaml"
            this.Refresh2.Click += new System.Windows.RoutedEventHandler(this.Refresh2_Click);
            
            #line default
            #line hidden
            return;
            case 9:
            this.Exit2 = ((System.Windows.Controls.Button)(target));
            
            #line 59 "..\..\..\Windows\MenagerWindow.xaml"
            this.Exit2.Click += new System.Windows.RoutedEventHandler(this.Exit2_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

