class Screen //<>//
{
  private Button[] _options;
  private Button _musicSelector;
  private Button[] _menu;
  private String[] _buttonText;
  private String[] _menuText = {" SchoolQuest ", " The Void ", " Quit "};
  public int[] _goesTo; 
  private String _title;
  private String _text;
  private int _tbW, _tbH; //Text Box Width and Height
  private int _textSize;
  private int _bgColor;
  JFileChooser _fc;
  FileNameExtensionFilter _filter;
  boolean _buttonPressed;

  public Screen(String title, String text, String[] buttonText, int[] goesTo, int bgColor)
  {
    _title = title;
    _text = text;
    _buttonText = buttonText; 
    _tbW = width - width/48;
    _tbH = height - height/3;
    _bgColor = bgColor;
    _textSize = 25;
    _goesTo = goesTo;
    _options = new Button[_buttonText.length];
    _menu = new Button[_menuText.length];
  }

  public Screen(String title, String text, String[] buttonText, int bgColor)
  {
    _title = title;
    _text = text;
    _buttonText = buttonText; 
    _tbW = width - width/48;
    _tbH = height - height/3;
    _bgColor = bgColor;
    _textSize = 25;
    _options = new Button[_buttonText.length];
    _menu = new Button[_menuText.length];
  }

  public void Update()
  {
    background(_bgColor); 
    DrawButtons(); //Draws buttons
    UpdateNames(); //Updates names
    DrawText();
    int x = _buttonText.length;
    switch(x)
    {
    case 1:
      println("Buttons Lead To: " + _goesTo[x - x] + " & Screen Is: " + currentScreen);
      break;
    case 2:  
      println("Buttons Lead To: " + _goesTo[x - x] + ", " + _goesTo[x - 1] + " & Screen Is: " + currentScreen);
      break;
    case 3:
      println("Buttons Lead To: " + _goesTo[x - x]+ ", " + _goesTo[x - 2] + ", " + _goesTo[x - 1] + " & Screen Is: " + currentScreen + " o " + clothingChoice[2]);
      break;
    default:
      println("There Are No Buttons On Screen! Screen: " + currentScreen);
      break;
    }
  }
  
  public void UpdateMenu()
  {
   background(_bgColor);
   DrawMenu();
  }


  private void DrawButtons()
  {
    DrawOptions();
    DrawMusicSelector();
  }

  private void DrawOptions() //Draws 3 buttons, assigns to them the goesTo information from Parse() 
  {
    for (int i = 0; i < _buttonText.length; i++) //Make as many buttons as there are labels for, no more no less; if 2 labels, 2 buttons; if 3 labels, 3 buttons.
    {
      _options[i] = new Button(_buttonText[i], width/2 - _buttonText[i].length(), height - height/3 + (height/18 * i), _goesTo[i]);
    }
    for (int i = 0; i < _buttonText.length; i++) //Updates said buttons
    {
      _options[i].Update();
    }
  }

  private void DrawMenu()
  {
    DrawText();
    for (int i = 0; i < _menuText.length; i++)
    {
      _menu[i] = new Button(_menuText[i], width/2 - _menuText[i].length(), height - height/3 + (height/18 * i), i + 1);
    }
    for (int i = 0; i < _menuText.length; i++)
    {
      _menu[i].Update3();
    }
  }

  private void DrawMusicSelector()
  {
    _musicSelector = new Button(" Music Selector ", float(width - width/12), float(height - height/3), 0); 
    _musicSelector.Update2();
  }


  private void UpdateNames()
  {
    if (currentScreen < 33 || currentScreen > 37)
    {

      if (currentScreen == 1 && playerName != "" && playerName != " " && keyPressed && key == ENTER) //If no player name is set, playerName = Zack
      {
        _text = _text.replaceAll("@PlayerName", playerName);
      }

      if (currentScreen > 1 && playerName != "" && playerName != " ")
      {
        _text = _text.replaceAll("@PlayerName", playerName);
        _text = _text.replaceAll("@PlayerLastName", playerLastName);
        for (int i = 0; i < _buttonText.length; i++)
        {
          _buttonText[i] = _buttonText[i].replaceAll("@PlayerName", playerName);
        }
      }

      if (currentScreen > 1 && playerName == "")
      {
        playerName = "Zack";
      }

      if ((currentScreen == 11 || currentScreen == 13) && friendName != "" && playerName != " " && keyPressed && key == ENTER)
      {
        _text = _text.replaceAll("@FriendName", friendName);
      }

      if (currentScreen > 13 && friendName != "" && playerName != " ") //If no friend name is set, friendName = Abhay
      {
        _text = _text.replaceAll("@FriendName", friendName);
        _text = _text.replaceAll("@FriendLastName", friendLastName);
        for (int i = 0; i < _buttonText.length; i++)
        {
          _buttonText[i] = _buttonText[i].replaceAll("@FriendName", friendName);
        }
      } 
      if (currentScreen > 13 && friendName == "")
      {
        friendName = "Abhay";
      }

      if (currentScreen == 14 && enemyName != "" && playerName != " " && keyPressed && key == ENTER)
      {        
        _text = _text.replaceAll("@EnemyName", enemyName);
      }
      if (currentScreen > 14 && enemyName != "" && enemyName != " ") //If no enemy name is set, enemyName = Rana
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