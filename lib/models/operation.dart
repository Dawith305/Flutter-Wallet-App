class Operation {

   String _operation;
   String _selectedIcon;
   String _unSelectedIcon;

   Operation(this._operation,this._selectedIcon,this._unSelectedIcon);

  get operation => this._operation;

 set operation( value) => this._operation = value;

  get selectedIcon => this._selectedIcon;

 set selectedIcon( value) => this._selectedIcon = value;

  get unSelectedIcon => this._unSelectedIcon;

 set unSelectedIcon( value) => this._unSelectedIcon = value;


}