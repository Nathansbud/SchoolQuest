class Button
{
  private String _labelText;
  private float _posX, _posY, _labelTextSize = width/72, _buttonWidth = _labelText.length() * _labelTextSize, _buttonHeight;
  private int _buttonCurve;  

  Button(String labelText, float posX, float posY, float buttonWidth, float buttonHeight) 
  {
    _labelText = labelText;
    _posX = posX;
    _posY = posY;
    _buttonWidth = buttonWidth;
    _buttonHeight = buttonHeight;
    _buttonCurve = 12;
  }

  void Draw()
  {
    noFill();
    rect(_posX, _posY, _buttonWidth, _buttonHeight, _buttonCurve);
    fill(0);
    text(_labelText, _posX, _posY);
  }
}