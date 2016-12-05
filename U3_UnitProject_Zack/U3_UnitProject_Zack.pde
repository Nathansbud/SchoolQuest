/* SchoolQuest (Working Title) //<>//
 
 A text adventure by Zack.
 
 */

String storyline[]; //Array of Text. This makes all the everything work.
String playerName = "", friendName = "", enemyName = "", lackeyName = "Janet"; //Strings used for player-input names of "characters." These replace the @CharacterName markers used in the textadventure.txt file
ArrayList<Screen> screens; 
int currentScreen = 1; //Current screen in the screens ArrayList being shown
//boolean playerNameSelected;
//boolean friendNameSelected;
//boolean enemyNameSelected;
boolean mouseIsReleased, drawScreen = true; //Used to trigger button presses

void setup()
{
  fullScreen();
  screens = new ArrayList<Screen>();
  storyline = loadStrings("textadventure.zk");
  Parse();
}

void draw()
{
  if(currentScreen == 0)
  {
   drawScreen = false;
  }
  if (screens.size() > 0) //Once screens are loaded in, draw them (the first is 1, and currentScreen is initially set to that value)
  {
    if(drawScreen)
    {
    screens.get(currentScreen).Update();
    } else
    {
     exit(); 
    }
  }
  mouseIsReleased = false; //mouseIsReleased is continually set to false so that the releasing of mouse is only registered for one frame, else would trigger buttons at any time
}

void keyPressed() //Replaces all @CharacterNames with player-inputted ones. However, not fully finished yet (drawing-wise, doesn't prevent player from not naming characters)
{
  if (currentScreen == 1) 
  {
    if (key == BACKSPACE)
    {
      if (playerName.length() > 0)
      {
        playerName = playerName.substring(0, playerName.length() - 1);
      }
    } else
      if (key != CODED && key != ENTER && playerName.length() <= 10)
      {
        playerName = playerName + key;
      }
  }
  if (currentScreen == 11 || currentScreen == 13)
  {
    if (key == BACKSPACE)
    {
      if (friendName.length() > 0)
      {
        friendName = friendName.substring(0, friendName.length() - 1);
      }
    } else
      if (key != CODED && key != ENTER && friendName.length() <= 10)
      {
        friendName = friendName + key;
      }
  }
  if (currentScreen == 14)
  {
    if (key == BACKSPACE)
    {
      if (enemyName.length() > 0)
      {
        enemyName = enemyName.substring(0, enemyName.length() - 1);
      }
    } else
      if (key != CODED && key != ENTER && enemyName.length() <= 10)
      {
        enemyName = enemyName + key;
      }
  }
  if (key == TAB)
  {
    currentScreen = 1;
  }
}

void Parse() //The real bread and butter of the program
{
  for (int i = 0; i < storyline.length; i++) //So long as all lines have not been read through, keep iterating
  {
    if (storyline[i].equals("#") || storyline[i].equals("# ")) //Looks for the line with only a # (or # with a space, in case of accidental space, to prevent issue)
    { //If it finds this line, it knows that a "screen chunk" is present
      i++; //Move to next line
      String title = storyline[i++]; //This moved-to line is the title of the screen. Record this line and increase i by 1
      String text = ""; //This moved-to line, always after the title, begins the body text of the page. This line can go until...
      while (storyline[i].charAt(0) != '>') //...the carat. Until the first character seen on a line is >, text is increased by each line of the storyline
      {
        text += storyline[i];
        i++; //Continually iterated until it reaches the carat
        while (storyline[i].length() == 0) //If it reaches a blank line, instead of crashing (as it would otherwise), replaces that blank line with 2 line breaks (as would be the reason for leaving a blank line in the first place)
        {
          storyline[i] = "\n\n";
        }
      }
      String currentLine = storyline[i].substring(1, storyline[i].length()); //The current line after reaching the carat should start after the carat, and stretch to the end of the line
      String[] buttonText; //The text of each button
      buttonText = split(currentLine, ", "); //Everything on currentLine should be put into an array, seperated by commas (there can only be three things)
      i++; //Increasing i by 1 puts the current line at the line after the carat, which tells the screens each button should lead to. 
      int[] goesTo; //Where each  button points to 
      goesTo = int(split(storyline[i], ", ")); //Same deal as buttons.
      screens.add(new Screen(title, text, buttonText, goesTo)); //Using all of this data, create new screen, with title at top, text as body, buttonText[] on buttons, and goesTo coming into play when button is clicked
    }
  }
}

void mouseReleased()
{
  mouseIsReleased = true; //True for a frame only, which is enough to check for button presses
}