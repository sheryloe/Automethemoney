# Automethemoney GitHub Pages 브로셔 운영 가이드

이 저장소는 `GitHub Pages + Google Stitch UI + 정적 HTML/CSS` 방식으로 운영한다.

- 목적: 홍보용 브로셔 페이지 운영
- 원칙: `API 연동 없음`, `백엔드 없음`, `GitHub Actions 없음`
- 배포: `docs/index.html`을 GitHub Pages로 직접 배포
- 자동화: 필요 시 `WSL cron`으로 정적 파일 변경 커밋/푸시

## 1. 최종 구조

```text
Automethemoney/
├─ docs/
│  ├─ index.html                 # GitHub Pages 실제 랜딩(브로셔)
│  └─ .nojekyll
├─ ops/
│  ├─ publish-pages.sh           # docs 변경 시 자동 커밋/푸시
│  ├─ install-pages-cron.sh      # crontab 등록
│  └─ setup-pages-cron.ps1       # PowerShell에서 WSL cron 설치
└─ README.md
```

## 2. 사전 환경 (WSL 기준)

### Windows PowerShell

```powershell
git --version
wsl --status
```

### WSL(Ubuntu) 패키지

```bash
sudo apt update
sudo apt install -y git cron
sudo service cron start
```

`cron`이 자동 시작되게 설정:

```bash
sudo systemctl enable cron
```

## 3. GitHub Actions 제거 상태

이 저장소는 `.github/workflows/*.yml`을 사용하지 않는다.

- CI/CD 액션 미사용
- `schedule` 액션 미사용
- Pages 배포는 GitHub Pages 기본 브랜치 배포 사용

## 4. GitHub Pages 설정

1. GitHub 저장소 접속
2. `Settings > Pages`
3. `Build and deployment`
4. `Source = Deploy from a branch`
5. `Branch = main`, `Folder = /docs`
6. 저장

배포 URL 예시:

- `https://<github-username>.github.io/Automethemoney/`

## 5. Google Stitch 기반 UI 적용 방식

원칙은 단순하다.

1. Google Stitch에서 브로셔 UI 생성
2. 생성된 결과를 정적 HTML/CSS로 내보냄
3. 이 저장소의 `docs/index.html`에 반영
4. 커밋/푸시하면 GitHub Pages에 반영

중요:

- 외부 API 키/토큰 연결 금지
- 서버 렌더링 금지
- 프레임워크 의존 없이 HTML/CSS 우선

## 6. 로컬 실행 (미리보기)

PowerShell에서 정적 확인:

```powershell
cd D:\Donggri_Platform\Automethemoney
python -m http.server 8080 -d docs
```

브라우저:

- `http://localhost:8080`

## 7. 수동 배포 (권장 기본)

```powershell
cd D:\Donggri_Platform\Automethemoney
git add docs/index.html
git commit -m "docs: update brochure"
git push origin main
```

## 8. 크론잡 배포 (Actions 대체)

GitHub Actions 대신, WSL cron으로 주기 실행한다.

### 8-1. 1회 설치 (PowerShell)

```powershell
cd D:\Donggri_Platform\Automethemoney
.\ops\setup-pages-cron.ps1 -RepoPathWsl "/mnt/d/Donggri_Platform/Automethemoney" -Branch "main" -Schedule "*/30 * * * *"
```

기본 스케줄 `*/30 * * * *` = 30분마다 실행.

### 8-2. 크론 확인 (WSL)

```bash
crontab -l
```

### 8-3. 로그 확인 (WSL)

```bash
tail -f /tmp/automethemoney-pages-cron.log
```

## 9. 운영 규칙

- 변경 대상은 `docs/` 중심으로 제한
- 브로셔 카피/디자인 변경만 반영
- API, DB, 서버 스크립트 연동 금지
- 문제 발생 시 cron 중단 후 수동 배포로 복구

cron 중단:

```bash
crontab -l | grep -v 'publish-pages.sh' | crontab -
```

## 10. 빠른 시작 요약

```powershell
cd D:\Donggri_Platform\Automethemoney
python -m http.server 8080 -d docs
# UI 확인 후
# docs/index.html 수정
# git add/commit/push
```

이 저장소의 GitHub Pages는 "홍보용 정적 브로셔"로만 운영한다.
