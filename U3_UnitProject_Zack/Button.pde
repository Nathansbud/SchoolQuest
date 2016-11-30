class Button
{
  private String _labelText;
  private float _posX, _posY, _labelTextSize, _buttonWidth, _buttonHeight;
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
    _buttonWidth = _labelText.length() * (_labelTextSize/1.5);
  }

  private void Draw()
  {
    fill(255);
    rect(_posX, _posY, _buttonWidth, _buttonHeight, _buttonCurve);
    fill(0);
    textSize(_labelTextSize);
    text(_labelText, _posX + _labelTextSize/1.5, _posY + _labelTextSize);
  }

  public void CheckPresses()
  {
    if (mousePressed)
    {
      if (mouseX > _posX && mouseX < _posX + _buttonWidth && mouseY > _posY && mouseY < _posY + _buttonHeight)
      {
        _buttonPressed = true;
        if (_buttonPressed)
        {
          currentScreen = _goesTo;
        }
      }
    }
  }

  public void Update()
  {
    Draw();
    CheckPresses();
  }
}