class Screen
{
  private Button _options[] = new Button[3];
  private String[] _buttonText = new String[3];
  public int[] _goesTo = new int[3];
  private String _title;
  private String _text;
  private int _tbW, _tbH; //Text Box Width and Height
  private int _textSize;

  Screen(String title, String text, String[] buttonText, int[] goesTo)
  {
    _title = title;
    _text = text;
    _buttonText = buttonText; 
    _tbW = width - width/48;
    _tbH = height - height/3;
    _textSize = 25;
    _goesTo = goesTo;
  }

  public void Draw()
  {
    background(255); 
    DrawButtons();
    for (int i = 0; i < 3; i++)
    {
      _options[i].Update();
    }
    if (playerName != "")
    {
      _text = _text.replaceAll("@PlayerName", playerName);
      _text = _text.replaceAll("@FriendName", friendName);
      _text = _text.replaceAll("@EnemyName", enemyName);
    }
    textSize(_textSize);
    fill(0);
    text(_title, q - (_title.length() * _textSize)/2, height/40); 
    text(_text, width/48, height/25, _tbW, _tbH);
    println(_goesTo[0]);
  }

  private void DrawButtons()
  {
    _options[0] = new Button(_buttonText[0], width/2 - _buttonText[0].length(), height - height/3, _goesTo[0]); //_goesTo[0]);
    _options[1] = new Button(_buttonText[1], width/2 - _buttonText[1].length(), height - height/3 + height/18, _goesTo[1]);
    _options[2] = new Button(_buttonText[2], width/2 - _buttonText[2].length(), height - height/3 + height/9, _goesTo[2]);
  }

  public void ButtonlessDraw()
  {
    background(255); 
    DrawButtons();
    if (playerName != "")
    {
      if (keyPressed && key == TAB)
      {
        _text = _text.replaceAll("@PlayerName", playerName);
        _text = _text.replaceAll("@FriendName", friendName);
        _text = _text.replaceAll("@EnemyName", enemyName);
      }
    }
    textSize(_textSize);
    fill(0);
    text(_title, q - (_title.length() * _textSize)/2, height/40); 
    text(_text, width/48, height/25, _tbW, _tbH);
    println(_goesTo[0]);
  }
}