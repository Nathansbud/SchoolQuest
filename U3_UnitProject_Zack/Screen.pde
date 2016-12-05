class Screen //<>//
{
  private Button[] _options;
  private String[] _buttonText; //= new String[3];
  public int[] _goesTo; //= new int[3];
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
    _options = new Button[_buttonText.length];
  }

  public void Update()
  {
    background(255); 
    DrawButtons(); //Draws buttons
    UpdateNames(); //Updates names
    DrawText();
    for (int i = 0; i < 1; i++)
    {
      println("Buttons Lead To: " + _goesTo[i] + ", " + _goesTo[i + 1] + ", " + _goesTo[i + 2] + " & Screen Is: " + currentScreen);
    }
  }

  private void DrawButtons() //Draws 3 buttons, assigns to them the goesTo information from Parse() 
  {
    for (int i = 0; i < _buttonText.length; i++) //Make as many buttons as there are labels for, no more no less; if 2 labels, 2 buttons; if 3 labels, 3 buttons.
    {
      _options[i] = new Button(_buttonText[i], width/2 - _buttonText[i].length(), height - height/3 + (height/18 * i), _goesTo[i]);
    }
  }

  private void UpdateNames()
  {
    for (int i = 0; i < _buttonText.length; i++) //Updates said buttons
    {
      _options[i].Update();
    }
    if (playerName != "") //If no player name is set, playerName = Zack
    {
      _text = _text.replaceAll("@PlayerName", playerName);
      for (int i = 0; i < _buttonText.length; i++)
      {
        _buttonText[i] = _buttonText[i].replaceAll("@PlayerName", playerName);
      }
    }
    if (currentScreen > 1 && playerName == "")
    {
      playerName = "Zack";
    }

    if (friendName != "") //If no friend name is set, friendName = Abhay
    {
      _text = _text.replaceAll("@FriendName", friendName);
      for (int i = 0; i < _buttonText.length; i++)
      {
        _buttonText[i] = _buttonText[i].replaceAll("@FriendName", friendName);
      }
    } 
    if (currentScreen > 13 && friendName == "")
    {
      friendName = "Abhay";
    }

    if (enemyName != "") //If no enemy name is set, enemyName = Rana
    {
      _text = _text.replaceAll("@EnemyName", enemyName);
      _text = _text.replaceAll("@LackeyName", lackeyName);
      for (int i = 0; i < _buttonText.length; i++)
      {
        _buttonText[i] = _buttonText[i].replaceAll("@EnemyName", enemyName);
        _buttonText[i] = _buttonText[i].replaceAll("@LackeyName", lackeyName);
      }
    } 
    if (currentScreen > 14 && enemyName == "")
    {
      enemyName = "Ranine";
      lackeyName = "Janet";
    }
  }
  private void DrawText()
  {
    textSize(_textSize); 
    fill(0);
    textAlign(CENTER);
    text(_title, width/2, height/40);  //Puts title at top center of screen
    textAlign(LEFT);
    text(_text, width/48, height/25, _tbW, _tbH); //Puts body text under title, goes until limits specified by textbox
  }
}