# VS Code Vim

## Basic

By default, vim will open a file in `Normal` mode. To enter `Insert` mode, press the insert or `ins` key to begin typing. To exit `Insert` mode, press the escape (`esc`) key to go back to `Normal` mode.

To navigate between text, we can use the traditional arrow keys, but we can also navigate using `H`, `J`, `K`, `L` keys.

- `H` - move cursor left
- `J` - move cursor down
- `K` - move cursor up
- `L` - move cursor right

In `Normal` mode, if we find a character we want to delete, we can press the `X` key. If we want to delete an entire line we can press `DD`. If that was a mistake, hit `U` to undo it.

When in `Normal` mode, we can press `:` to enter `Command` mode. We can do stuff like `:2` to take the mouse cursor to line 2.

To paste from the system keyboard, we enter `+P` in `Normal` mode.

We can hit `:W` to save the file. However, Control (`ctrl`) + `S` will also save the file.
