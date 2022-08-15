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
if status is-interactive
    # Commands to run in interactive sessions can go here
end
