set -g -x  XDG_CURRENT_DESKTOP sway
set -g -x MOZ_ENABLE_WAYLAND 1
set -g -x SDL_VIDEODRIVER wayland
set -g -x _JAVA_AWT_WM_NONREPARENTING 1
set -g -x ELM_DISPLAY wl
set -g -x ECORE_EVAS_ENGINE wayland_egl
set -g -x ELM_ENGINE wayland_egl
set -g -x ELM_ACCEL opengl
set -g -x EDITOR nvim
set -g -x PATH $HOME/.cargo/bin $PATH
set -g -x TERM xterm-256color
set -g -x PATH $HOME/.local/bin $PATH
set --universal nvm_default_version v16.17.0
set -g -x SSH_AUTH_SOCK /run/user/1000/keyring/ssh
set -g -x GNOME_KEYRING_CONTROL /run/user/1000/keyring
set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew";
set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew";
set -q PATH; or set PATH ''; set -gx PATH "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin" $PATH;
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/home/linuxbrew/.linuxbrew/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH;
alias cat  "bat";
alias ls "exa --icons";
alias vi "nvim";
alias vim "nvim";
if status is-interactive
    # Commands to run in interactive sessions can go here
end
