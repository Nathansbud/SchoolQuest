class Screen
{
  Button _options[];
  int storyLineNumber = 0;
  int _screenNumber;

  Screen(String buttonLabelText, String buttonLabelTextDos, String buttonLabelTextTres, float posX, float posY, float buttonHeight, int screenNumber)
  {
    background(4); 
    textSize(25); 
    _options[0] = new Button(buttonLabelText, posX, posY, buttonHeight);
    _options[1] = new Button(buttonLabelTextDos, posX, posY + height/18, buttonHeight);
    _options[2] = new Button(buttonLabelTextTres, posX, posY + height/9, buttonHeight);

    for (int i = 0; i < 3; i++)
    {
      _options[i].Update();
    }
    _screenNumber = screenNumber = storyLineNumber;
    storyLine[storyLineNumber] = storyLine[storyLineNumber].replaceAll("@PlayerName", playerName);
    text(storyLine[storyLineNumber], width/48, height/30, width - width/48, height - height/3);
  }

  void mouseClicked()
  {
  }
}