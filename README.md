# dotfiles

macOS 개발 환경을 [chezmoi](https://www.chezmoi.io/)로 관리하는 dotfiles.

## Bootstrap (새 머신)

### 1. GPG 키 준비

```bash
# 이전 머신에서
cd ~/dotfiles && make gpg-export
# → .gpg/ 디렉토리에 키 파일 생성

# .gpg/ 폴더를 USB, AirDrop 등으로 새 머신의 ~/dotfiles에 전달
```

### 2. dotfiles 적용

```bash
xcode-select --install
git clone https://github.com/rscarrera27/dotfiles.git ~/dotfiles
# .gpg/ 폴더를 ~/dotfiles에 복사
cd ~/dotfiles && make
```

`make`가 Xcode CLI 확인 → GPG 키 검증 → chezmoi 설치 → `chezmoi init --apply` → GPG 키 import + `.gpg/` 삭제를 순서대로 실행합니다.

## 자동으로 수행되는 작업

| 순서 | 스크립트 | 동작 |
|---|---|---|
| 1 | `run_before_install-homebrew` | Homebrew 설치 |
| 2 | `run_before_install-ohmyzsh` | oh-my-zsh 설치 |
| 3 | `run_before_setup-pinentry-mac` | pinentry-mac 설정 + GPG agent 재시작 |
| 4 | `run_onchange_brew-bundle` | `brew bundle` 실행 (Brewfile 변경 시 재실행) |
| 5 | `run_after_clone-zsh-plugins` | zsh 플러그인 설치 |
| 6 | `run_after_install-ai-tools` | Claude Code 설치 |
| 7 | `run_after_link-iterm2-prefs` | iTerm2 설정 심링크 |
| 8 | `run_after_link-vscode-settings` | VSCode 설정 심링크 |

## 배포되는 dotfiles

| Source | Target |
|---|---|
| `dot_zshrc` | `~/.zshrc` |
| `dot_zshenv` | `~/.zshenv` |
| `dot_zalias` | `~/.zalias` |
| `dot_gitconfig.tmpl` | `~/.gitconfig` |
| `private_dot_config/mise/config.toml` | `~/.config/mise/config.toml` |
| `private_dot_config/ghostty/config` | `~/.config/ghostty/config` |
| `private_dot_config/aerospace/aerospace.toml` | `~/.config/aerospace/aerospace.toml` |
| `private_dot_gnupg/gpg-agent.conf.tmpl` | `~/.gnupg/gpg-agent.conf` |
| `private_Library/Fonts/encrypted_MonoLisa-*.otf.asc` | `~/Library/Fonts/MonoLisa-*.otf` (GPG 복호화) |
| `vscode/settings.json` | `~/Library/Application Support/Code/User/settings.json` (심링크) |
| `vscode/keybindings.json` | `~/Library/Application Support/Code/User/keybindings.json` (심링크) |

## mise tasks

```bash
mise run java     # fzf로 Java 버전 선택 후 설치
mise run python   # fzf로 Python 버전 선택 후 설치
mise run node     # fzf로 Node 버전 선택 후 설치
```

## 일상 사용

```bash
chezmoi apply             # 변경사항 적용
chezmoi update            # 원격 저장소에서 pull + apply
chezmoi diff              # 적용 전 변경사항 미리보기
```
