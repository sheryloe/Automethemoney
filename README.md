# Automethemoney 포트폴리오 가이드

Automethemoney는 `GitHub-hosted Actions + Supabase + Vercel` 구조로 구현한 페이퍼 트레이딩 자동화 포트폴리오다.

- 목적: 자동 실행 + 상태 저장 + 운영 조회를 분리한 서비스 구조를 실제로 구현
- 공개 페이지: GitHub Pages (`docs/index.html`)
- 페이지 성격: 포트폴리오 소개 + 실제 구현 화면 스크린샷
- 디자인 톤: 하늘색 + 라이트 브라운

## 프로젝트 구조 요약

1. `GitHub-hosted Actions`
- 주기 실행으로 배치 사이클 트리거

2. `Supabase`
- 하트비트/모델 설정/포지션/일일 성과 이력 저장

3. `Vercel`
- 운영 화면 제공 및 상태 조회

## GitHub Pages 반영 방식

1. `docs/index.html` 포트폴리오 내용 수정
2. `docs/assets/screenshots/` 스크린샷 교체 또는 추가
3. 커밋/푸시 후 Pages 반영 확인

서비스 주소:

- `https://sheryloe.github.io/Automethemoney/`

## 배포 명령 (PowerShell)

```powershell
cd D:\Donggri_Platform\Automethemoney
git add docs/index.html README.md docs/assets/screenshots
git commit -m "docs: 포트폴리오 페이지 및 스크린샷 갱신"
git push origin main
```

## 유지관리 원칙

- 소개 문구는 "무엇을 만들었는가 / 어떻게 구성했는가 / 실제 화면" 순서 유지
- 스크린샷은 실제 구현 화면만 사용
- 페이지는 포트폴리오 설명 목적에 집중
