class Button
{
  private String _labelText; 
  private float _posX, _posY, _labelTextSize, _buttonWidth, _buttonHeight, _buttonPosX;
  private int _buttonCurve;  
  private int _goesTo;
  private boolean _buttonPressed;

  Button(String labelText, float posX, float posY, int goesTo) 
  {
    _goesTo = goesTo;
    _labelText = labelText;
    _labelTextSize = width/72;
    _posX = posX;
    _posY = posY;
    _buttonHeight = height/30;
    _buttonCurve = 12;
    _labelTextSize = 20;
    _buttonWidth = textWidth(_labelText); //Width of buttons is the horizontal size of the button label.
    _buttonPosX = _posX - 0.5 * textWidth(_labelText); //Button positioning is at centerpoint of text - half of the text's horizontal length.
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
        mouseIsReleased = false; //Potentially overkill. Already done in draw.
      }
    }
  }

  public void Update()
  {
    Draw();
    CheckPresses();
  }
}