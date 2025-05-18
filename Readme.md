# Balatro Alt Saves
Overwrites the `Profile` system to use your own configured Profile Prefix.  This effectively enables you to have infinite save files if you so chose.

This is primarily meant for playing Content Mods like `Pokermon` and `Cryptid`.

### Note:
`CRYPTID` mod is not currently compatible with this mod, due to the fact that I basically did the same patch they did over the save menu.  If you'd like to use `CRYPTID` with this mod, you have to remove the function at line `477` in `lib/gameset.lua` in `CRYPTID`

## Known Bugs
If you change the Prefix, and then try to change profiles, without closing the game, it will crash.  This is simply fixed by me making the game full close itself when configuring, but thats for another release.