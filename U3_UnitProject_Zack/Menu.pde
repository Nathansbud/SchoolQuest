String[] menuButtons = {"SchoolQuest", "The Void", "Quit"}; //Buttons for Menu. Not technically part of Menu class, but keeping it here for organization reasons

class Menu extends Screen //I was dying from the clutter over on Screen, so I'm splitting it up into a few smaller classes that inherit things from it.
{
  //Note: bgColor is currently pretty useless. Not quite sure how to fix this, but, uh, it is? 
  private Button[] _menu;
  private String[] _menuText = {" SchoolQuest ", " The Void ", " Quit "};

  Menu(String title, String[] buttonText)
  {
    super(title, buttonText); 
    _menu = new Button[_menuText.length];
  }

  public void UpdateMenu() //Not a very original class. Just sort of extending Screen. Really doesn't need to be its own thing. But it is, damn it!
  {
    background(bgColor);
    DrawMenu();
  }

  public void DrawMenu()
  {
    DrawTitle();
    for (int i = 0; i < _menuText.length; i++)
    {
      _menu[i] = new Button(_menuText[i], width/2 - _menuText[i].length(), height - height/3 + (height/18 * i), i + 1, "Menu");
    }
    for (int i = 0; i < _menuText.length; i++)
    {
      _menu[i].Update();
    }
  }
}