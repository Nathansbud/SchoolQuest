class Button
{
  private String _labelText, _buttonType; //Label Text: Button Text, Button Type: Type of Button (Story Option, Menu, Music Selector, Inventory...)
  private float _posX, _posY, _labelTextSize, _buttonWidth, _buttonHeight, _buttonPosX; //Coordinates/sizing of button (and labelTextSize)
  private int _buttonCurve;  
  private int _goesTo; //Button lead-to on click
  private int _textColor, _buttonColor; //Color of text/button color
  private boolean _buttonPressed; //Checks to see if button pressed
  private JFileChooser _fc; //Music Selecter file selector
  private FileNameExtensionFilter _musicFilter; //Music-type file extension filter
  
  public Button(String labelText, float posX, float posY, int goesTo, String buttonType) //Story Buttons
  {
    _buttonType = buttonType; 
    _goesTo = goesTo;
    _labelText = labelText;
    _labelTextSize = width/72;
    _posX = posX;
    _posY = posY;
    _buttonHeight = height/30;
    _buttonCurve = 12;
    _labelTextSize = 20;
    _textColor = 0;
    _buttonColor = 255;
    _buttonWidth = textWidth(_labelText); //Width of buttons is the horizontal size of the button label.
    _buttonPosX = _posX - 0.5 * textWidth(_labelText); //Button positioning is at centerpoint of text - half of the text's horizontal length.
  }

  public Button(String labelText, float posX, float posY, String buttonType) //Non-story buttons
  {
    _buttonType = buttonType;
    _labelText = labelText;
    _labelTextSize = width/72;
    _posX = posX;
    _posY = posY;
    _buttonHeight = height/30;
    _buttonCurve = 12;
    _labelTextSize = 20;
    _textColor = 0;
    _buttonColor = 255;
    _buttonWidth = textWidth(_labelText); 
    _buttonPosX = _posX - 0.5 * textWidth(_labelText); 
  }

  private void Draw()
  {

    textAlign(CENTER); //Text alligned in the center for tidiness and aesthetics
    fill(_buttonColor);
    rect(_buttonPosX, _posY, _buttonWidth, _buttonHeight, _buttonCurve);
    fill(_textColor);
    textSize(_labelTextSize);
    text(_labelText, _posX, _posY + _labelTextSize);
    textAlign(LEFT); //Realligned to left for everything else
  }

  public void CheckPresses()
  {
    if (mouseIsReleased) //If mouse ever released, check if mouse is over button. 
    {
      if (mouseX > _buttonPosX && mouseX < _buttonPosX + _buttonWidth && mouseY > _posY && mouseY < _posY + _buttonHeight)
      {
        _buttonPressed = true; //If so, button pressed
      }  
      if (_buttonPressed)
      {
        switch(_buttonType) //Look to see what type of button
        {
        case "Story": //If story: current Screen = "_goesTo" of button.
          currentScreen = _goesTo;
          break;
        case "Music": //If music: open file selector
          FileSelector();
          break;
          //case:
        case "Menu": //If menu: change state to Button's _goesTo
          state = _goesTo;
          break;
        case "Inventory": //If inventory: open inventory
          InventoryManager();
          break;
        }
      }
    }
  }

  public void Update()
  {
    Draw();
    CheckPresses();
  }

  private void FileSelector()
  {
    _fc = new JFileChooser(); //Create file chooser
    _musicFilter = new FileNameExtensionFilter("Music Files", "mp3", "wav"); //Create filter
    _fc.setFileFilter(_musicFilter); //Set filter
    int returnVal = _fc.showOpenDialog(null); //Open selector
    if (returnVal == _fc.APPROVE_OPTION)  //Check to see if approved
    {
      File selectedFile = _fc.getSelectedFile();
      songName = selectedFile.getAbsolutePath();
      songSelected = true;
    } else
    {
      _fc.cancelSelection();
    }
  }

  private void InventoryManager()
  {
    Object[] options = inventory.toArray(); //Inventory converted into Array of objects
    String choice = (String)JOptionPane.showInputDialog(null, "Choose an item?", "Item Selection", JOptionPane.PLAIN_MESSAGE, null, options, options[0]); //Return string "choice" based on chosen item
    if (choice == null) //In event that inventory is cancelled, do nada
    {
      return;
    }
    switch(state) //Dunno if this does anything right now? Probably not. Too lazy to check right now. Lotta redundancies in this area 
    {
    case 0:
      options = null;
      break;
    }
    switch(choice) //Evaluate item chosen
    {
    case "Laptop": //If laptop
      switch(currentScreen) //Check screen
      {
      case 44: //Open game choice dialog
        Object[] games = {"Crypt of the NecroDancer", "The Binding of Isaac", "Enter the Gungeon"};
        int gameChoice = JOptionPane.showOptionDialog(frame, "Which game would you like to play?", "Game Selection", JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE, null, games, games[2]);
        switch(gameChoice)
        {
        case 0: //NecroDancer
          gameState = 0;
          break;
        case 1: //Isaac
          gameState = 1;
          break;
        case 2: //Gungeon
          gameState = 2;
          break;
        }
        break;
      default: //Else usually just don't do anything
        JOptionPane.showMessageDialog(null, "You recall some dumb quote from a game you once played: ''There's a time and place for everything, but not now...'' The " + choice.toLowerCase() + " could not be used at this time.", "Attempted Item Use", JOptionPane.DEFAULT_OPTION);
        break;
      }
      break;
    case "Robot": //If robot
      switch(currentScreen)
      {
      case 7: //Beep.
        JOptionPane.showMessageDialog(null, "Beep boop.", "BEEP", JOptionPane.DEFAULT_OPTION);
        break;
      default: //...or nothing
        JOptionPane.showMessageDialog(null, "You recall some dumb quote from a game you once played: ''There's a time and place for everything, but not now...'' The " + choice.toLowerCase() + " could not be used at this time.", "Attempted Item Use", JOptionPane.DEFAULT_OPTION);
        break;
      }
      break;

    case "Desktop": //Same deal.
      switch(currentScreen)
      {
      case 2:
        String computerPassword = (String)JOptionPane.showInputDialog("Please Enter Password");
        switch(computerPassword)
        {
        case "zack":
          JOptionPane.showMessageDialog(null, "Logged in successfully!", "Password Attempt", JOptionPane.DEFAULT_OPTION);
          currentScreen = 40;
          break;
        default:
          JOptionPane.showMessageDialog(null, "Incorrect password.", "Password Attempt", JOptionPane.DEFAULT_OPTION);
          break;
        }
        break;
      }
      //int index = inventory.indexOf(choice);
    }
  }
}