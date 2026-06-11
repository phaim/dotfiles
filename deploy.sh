#!/usr/bin/env bash
# Stow dotfiles into $HOME. Run from the dotfiles repo root.

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="$HOME"
STOW_OP="-S"
IGNORE_ARGS=()
WM_MODE="all"
DRY_RUN=false

usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Options:
  --all         Link all configs (default)
  --no-sway     Exclude sway and waybar (for i3 setups)
  --no-i3       Exclude i3 and polybar (for sway setups)
  --delete      Remove symlinks instead of creating them
  --restow      Restow (re-create links, useful to fix broken symlinks)
  --dry-run     Show what would be done without making changes
  -h, --help    Show this help

Examples:
  $(basename "$0")              # link everything
  $(basename "$0") --no-sway   # skip sway/waybar
  $(basename "$0") --no-i3     # skip i3/polybar
  $(basename "$0") --delete    # remove all managed symlinks
EOF
}

for arg in "$@"; do
    case "$arg" in
        --all)      WM_MODE="all" ;;
        --no-sway)  WM_MODE="no-sway" ;;
        --no-i3)    WM_MODE="no-i3" ;;
        --delete)   STOW_OP="-D" ;;
        --restow)   STOW_OP="-R" ;;
        --dry-run)  DRY_RUN=true ;;
        -h|--help)  usage; exit 0 ;;
        *)          echo "Unknown option: $arg"; usage; exit 1 ;;
    esac
done

case "$WM_MODE" in
    no-sway)
        IGNORE_ARGS=(--ignore='sway' --ignore='waybar')
        echo "Mode: i3 (skipping sway, waybar)"
        ;;
    no-i3)
        IGNORE_ARGS=(--ignore='i3' --ignore='polybar')
        echo "Mode: sway (skipping i3, polybar)"
        ;;
    *)
        echo "Mode: all"
        ;;
esac

CMD=(stow
    --dir="$(dirname "$DOTFILES_DIR")"
    --target="$TARGET"
    "${IGNORE_ARGS[@]+"${IGNORE_ARGS[@]}"}"
    "$STOW_OP"
    "$(basename "$DOTFILES_DIR")"
)

if "$DRY_RUN"; then
    CMD+=(--simulate --verbose)
    echo "Dry run: ${CMD[*]}"
fi

"${CMD[@]}"
echo "Done."
