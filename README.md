# Automethemoney 포트폴리오 (기술 면접관용 요약)

Automethemoney는 `GitHub-hosted Actions + Supabase + Vercel` 구조로 구현한 페이퍼 트레이딩 자동화 시스템 포트폴리오다.

- 한 줄 소개: 자동 실행·기록·조회가 연결된 운영형 트레이딩 파이프라인 구현
- 공개 페이지: GitHub Pages (`docs/index.html`)
- 증빙 구성: 실제 스크린샷 2장 + 아키텍처 다이어그램 1개
- 디자인 톤: 하늘색 + 라이트 브라운

## 아키텍처 요약

- 실행 계층: GitHub-hosted Actions 스케줄 트리거
- 처리 계층: 배치 스크립트로 모델/상태 계산
- 저장 계층: Supabase 테이블에 상태/성과 기록
- 조회 계층: Vercel 대시보드에서 운영 상태 확인

## Step 1~5 구현 흐름

1. Step 1 문제 정의
- 수동 운영의 누락/추적 한계를 자동화 대상으로 정의
- 입력 → 처리 → 산출: 수동 이슈 → 자동화 요구 식별 → 주기 실행 조건 정의

2. Step 2 실행 파이프라인 설계
- Actions 스케줄로 배치 진입점을 고정해 자동 사이클 구성
- 입력 → 처리 → 산출: 스케줄 조건 → 배치 실행 → 사이클 실행 로그

3. Step 3 데이터 모델링
- 하트비트/설정/포지션/일일 성과 분리 저장 구조 설계
- 입력 → 처리 → 산출: 실행 결과 → 테이블별 저장 → 추적 가능한 상태 이력

4. Step 4 운영 UI 구성
- Supabase 기록을 운영 대시보드 지표로 매핑
- 입력 → 처리 → 산출: 저장 데이터 → 조회 렌더링 → 운영 판단 화면

5. Step 5 검증 및 운영 기준
- 하트비트/데이터 적재/UI 반영을 체크해 정상 동작 판정
- 입력 → 처리 → 산출: 실행 후 상태 → 기준 대조 → 운영 가능 여부 판단

## 실제 구현 화면 위치

- `docs/assets/screenshots/auto-trading-cover.png`
- `docs/assets/screenshots/auto-trading-dashboard.png`

## 배포 명령 (PowerShell)

```powershell
cd D:\Donggri_Platform\Automethemoney
git add docs/index.html README.md
git commit -m "docs: 기술 면접관용 Step 1-5 포트폴리오 랜딩 고도화"
git push origin main
```

## 검증 체크 기준

- 스케줄 실행 여부: 하트비트 최신 갱신 확인
- 데이터 적재 여부: 핵심 테이블 최신 레코드 확인
- 대시보드 조회 여부: UI 최신 상태 노출 확인
