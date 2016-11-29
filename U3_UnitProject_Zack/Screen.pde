class Screen
{
  private Button _options[] = new Button[3];
  // private color _backgroundColor, _textColor;
  private String _title;
  private String _text;
  private String[] _buttonText = new String[3];
  private int _tbW, _tbH; //Text Box Width and Height
  private int _textSize;
  

  Screen(String title, String text, String[] buttonText)
  {
    _title = title;
    _text = text;
    _buttonText = buttonText; 
    _tbW = width - width/48;
    _tbH = height - height/3;
    _textSize = 25;
  }

  void Draw()
  {
    background(255); 
    DrawButtons();
    for (int i = 0; i < 3; i++)
    {
      _options[i].Update();
    }
    _text = _text.replaceAll("@PlayerName", playerName);
    _text = _text.replaceAll("@FriendName", friendName);
    _text = _text.replaceAll("@EnemyName", enemyName);
    textSize(_textSize);
    fill(0);
    text(_title, q - (_title.length() * _textSize)/2, height/50); 
    text(_text, width/48, height/25, _tbW, _tbH);
  }

  void DrawButtons()
  {
    _options[0] = new Button(_buttonText[0], width/2, height/2);
    _options[1] = new Button(_buttonText[1], width/2, height/2 + height/18);
    _options[2] = new Button(_buttonText[2], width/2, height/2 + height/9);
  }
}