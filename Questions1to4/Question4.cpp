#include <stdint.h>
/* To me, it feels like the memory leak is coming the lack of destructors
    since this is more of a c++ problem than Lua
*/
void Game::addItemToPlayer(const std::string &recipient, uint16_t itemId) {
  Player *player = g_game.getPlayerByName(recipient);
  if (!player) {
    player = new Player(nullptr);
    if (!IOLoginData::loadPlayerByName(player, recipient)) {
      delete player; // If you can't find the player, just remove the allocated memory
      return 0; // and it returns false
    }
  }

  Item *item = Item::CreateItem(itemId);
  if (!item) {
    delete item; // if the item cannot be created, take out the space
    return 0; // and return false
  }

  g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER,
                         FLAG_NOLIMIT);

  if (player->isOffline()) {
    IOLoginData::savePlayer(player);
  }
}