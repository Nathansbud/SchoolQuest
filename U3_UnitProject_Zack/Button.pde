class Button
{
  private String _labelText; 
  private float _posX, _posY, _labelTextSize, _buttonWidth, _buttonHeight, _buttonPosX;
  private int _buttonCurve;  
  private int _goesTo;
  private int _textColor, _buttonColor;
  private boolean _buttonPressed;
  JFileChooser _fc;
  FileNameExtensionFilter _filter;
  JDialog dialog;

  public Button(String labelText, float posX, float posY, int goesTo) 
  {
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

  public Button(String labelText, float posX, float posY) 
  {
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
    if (mouseIsReleased) //If mouse ever released, check if mouse is over button. If so, button has been pressed, and currentScreen = that button's "_goesTo"
    {
      if (mouseX > _buttonPosX && mouseX < _buttonPosX + _buttonWidth && mouseY > _posY && mouseY < _posY + _buttonHeight)
      {
        _buttonPressed = true;
      }  
      if (_buttonPressed)
      {
        currentScreen = _goesTo;
      }
    }
  }

  public void CheckPresses2()
  {
    if (mouseIsReleased) //If mouse ever released, check if mouse is over button. If so, button has been pressed, and currentScreen = that button's "_goesTo"
    {
      if (mouseX > _buttonPosX && mouseX < _buttonPosX + _buttonWidth && mouseY > _posY && mouseY < _posY + _buttonHeight)
      {
        _buttonPressed = true;
      }
      if (_buttonPressed)
      {
        FileSelector();
      }
    }
  }

  public void CheckPresses3()
  {
    if (mouseIsReleased) //If mouse ever released, check if mouse is over button. If so, button has been pressed, and currentScreen = that button's "_goesTo"
    {
      if (mouseX > _buttonPosX && mouseX < _buttonPosX + _buttonWidth && mouseY > _posY && mouseY < _posY + _buttonHeight)
      {
        _buttonPressed = true;
      }
      if (_buttonPressed)
      {
        state = _goesTo;
      }
    }
  }

  public void Update()
  {
    Draw();
    CheckPresses();
  }

  public void Update2()
  {
    Draw();
    CheckPresses2();
  }

  public void Update3()
  {
    Draw();
    CheckPresses3();
  }

  private void FileSelector()
  {
    _fc = new JFileChooser();
    _fc.setCurrentDirectory(new File(System.getProperty("user.home")));
    _filter = new FileNameExtensionFilter("Music Files", "mp3", "wav");
    _fc.setDragEnabled(true);
    _fc.setFileFilter(_filter);
    _fc.setCurrentDirectory(new File(System.getProperty("user.home")));
    int result  = _fc.showOpenDialog(null);
    if (result == _fc.APPROVE_OPTION) 
    {
      File selectedFile = _fc.getSelectedFile();
      songName = selectedFile.getAbsolutePath();
      songSelected = true;
    } else
    {
      _fc.cancelSelection();
    }
  }
}