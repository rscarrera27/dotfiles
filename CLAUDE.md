# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 개요

chezmoi 기반 macOS dotfiles 저장소. 이 디렉토리 자체가 chezmoi source directory이다.

## 주요 명령어

- `make` — 새 머신 부트스트랩 (`.gpg/` 필수). Xcode CLT 확인 → chezmoi 설치 + apply → GPG 키 import
- `make gpg-export` — 현재 머신의 GPG 키를 `.gpg/`로 추출
- `chezmoi apply` — 변경사항 적용 (일상 사용)
- `chezmoi diff` — 적용 전 미리보기

## 아키텍처

### chezmoi 네이밍 규칙

| Prefix | 의미 | 예시 |
|---|---|---|
| `dot_` | `~/.파일명`으로 배포 | `dot_zshrc` → `~/.zshrc` |
| `.tmpl` suffix | Go 템플릿. `.chezmoi.toml`의 `[data]` 참조 | `dot_gitconfig.tmpl` |
| `private_dot_` | 0600 권한으로 배포 | `private_dot_config/` |

### 스크립트 실행 순서

chezmoi는 `before` → main(파일 배포 + `onchange`) → `after` 순서로 실행한다. 각 단계 내에서는 알파벳순.

1. **before**: Homebrew 설치 → oh-my-zsh 설치
2. **main**: `brew bundle` (Brewfile 해시 변경 시 재실행)
3. **after**: zsh 플러그인 clone → iTerm2 plist 심링크 → Claude Code 설치

### 배포하지 않는 파일

`.chezmoiignore`에 등록된 파일(`README.md`, `Brewfile`, `Makefile`, `com.googlecode.iterm2.plist`)은 `~`에 복사되지 않는다. 단, 스크립트에서 참조는 가능 (`Brewfile` → brew-bundle 스크립트, `com.googlecode.iterm2.plist` → symlink 스크립트).

### 템플릿 데이터

`.chezmoi.toml`에 하드코딩된 값(`git_name`, `git_email`, `git_sign_key`)을 `.tmpl` 파일에서 `{{ .변수명 }}`으로 참조.

## 파일 수정 시 주의사항

- **dotfile 내용 변경**: `dot_*` 파일을 직접 편집. `chezmoi apply`로 반영.
- **새 dotfile 추가**: `dot_파일명` 네이밍으로 생성, 배포 불필요 시 `.chezmoiignore`에 추가.
- **Brewfile 변경**: `run_onchange_brew-bundle.sh.tmpl`이 Brewfile 해시를 추적하므로 다음 `chezmoi apply` 시 자동 재실행.
- **새 스크립트 추가**: `.chezmoiscripts/`에 `run_{before,after}_이름.sh` 패턴으로 생성. 모든 스크립트는 매 apply마다 실행되므로 반드시 내부에 멱등성 가드를 포함해야 함. 실행 순서는 before/after 단계와 알파벳순으로 결정됨.
