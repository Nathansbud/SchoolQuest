class Button
{
  private String _labelText;
  private float _posX, _posY, _labelTextSize, _buttonWidth, _buttonHeight;
  private int _buttonCurve;  

  Button(String labelText, float posX, float posY) 
  {
    _labelText = labelText;
    _labelTextSize = width/72;
    _posX = posX;
    _posY = posY;
    _buttonHeight = height/30;
    _buttonCurve = 12;
    _labelTextSize = 20;
    _buttonWidth = _labelText.length() * _labelTextSize;    
  }

  private void Draw()
  {
    fill(255);
    rect(_posX, _posY, _buttonWidth, _buttonHeight, _buttonCurve);
    fill(0);
    textSize(_labelTextSize);
    text(_labelText, _posX + _labelTextSize/1.5, _posY + _labelTextSize);
  }

  public void Update()
  {
    Draw();
  }
}