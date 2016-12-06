class Button
{
  private String _labelText; 
  private float _posX, _posY, _labelTextSize, _buttonWidth, _buttonHeight, _buttonPosX;
  private int _buttonCurve;  
  private int _goesTo;
  private boolean _buttonPressed;
  JFileChooser _fc;
  FileNameExtensionFilter _filter;

  private int _octave;

  public Button(String labelText, float posX, float posY, int goesTo, int octave) 
  {
    _goesTo = goesTo;
    _labelText = labelText;
    _octave = octave;
    _labelTextSize = width/72;
    _posX = posX;
    _posY = posY;
    _buttonHeight = height/30;
    _buttonCurve = 12;
    _labelTextSize = 20;
    _buttonWidth = textWidth(_labelText); //Width of buttons is the horizontal size of the button label.
    _buttonPosX = _posX - 0.5 * textWidth(_labelText); //Button positioning is at centerpoint of text - half of the text's horizontal length.
  }

  public Button(String labelText, float posX, float posY)//,// boolean buttonPressed2) 
  {
    _labelText = labelText;
    _labelTextSize = width/72;
    _posX = posX;
    _posY = posY;
    _buttonHeight = height/30;
    _buttonCurve = 12;
    _labelTextSize = 20;
    _buttonWidth = textWidth(_labelText); //Width of buttons is the horizontal size of the button label.
    _buttonPosX = _posX - 0.5 * textWidth(_labelText); //Button positioning is at centerpoint of text - half of the text's horizontal length.
    _fc = new JFileChooser();
    _filter = new FileNameExtensionFilter("Music Files", "mp3", "wav", "m4a");
  }

  private void Draw()
  {

    textAlign(CENTER); //Text alligned in the center for tidiness and aesthetics
    fill(255);
    rect(_buttonPosX, _posY, _buttonWidth, _buttonHeight, _buttonCurve);
    fill(0);
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
        //note.playNote("E" + _octave);
        //note.playNote("E" + (_octave + 1));
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

private void FileSelector()
{
  _fc.setDragEnabled(true);
  _fc.setFileFilter(_filter);
  int r = _fc.showOpenDialog(null);
  if (r == _fc.APPROVE_OPTION) 
  {
    songName = _fc.getSelectedFile().getAbsolutePath();
    songSelected = true;
  } else
  {
    _fc.cancelSelection();
  }
}
}