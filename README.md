# Automethemoney GitHub Pages 서비스 소개 가이드

Automethemoney는 `GitHub Pages + Google Stitch UI + 정적 HTML/CSS` 기반의 서비스 소개 브로셔로 운영한다.

- 목적: 일반 방문자 대상 서비스 설명
- 채널: GitHub Pages 단일 운영
- 정책: API/백엔드/Actions 미사용
- 메인 편집 파일: `docs/index.html`
- 컬러 가이드: 하늘색 + 라이트 브라운 팔레트 고정

## 핵심 운영 방식

1. Google Stitch에서 서비스 소개 UI 생성
2. 결과를 정적 HTML/CSS로 정리
3. `docs/index.html`에 반영
4. `git push` 후 GitHub Pages 공개

## GitHub Pages 설정

1. 저장소 `Settings > Pages`
2. `Source = Deploy from a branch`
3. `Branch = main`, `Folder = /docs`
4. 저장

배포 URL:

- `https://sheryloe.github.io/Automethemoney/`

## 유지관리 최소 가이드

변경 대상은 `docs/index.html` 중심으로 유지한다.

- 서비스 소개 문구
- 브로셔 섹션 순서
- 하늘색/라이트 브라운 UI 스타일
- CTA 버튼 링크

## 배포 명령 (PowerShell)

```powershell
cd D:\Donggri_Platform\Automethemoney
git add docs/index.html README.md
git commit -m "docs: refresh GitHub Pages service brochure"
git push origin main
```

이 저장소는 GitHub Pages 서비스 소개 브로셔 용도로만 운영한다.
