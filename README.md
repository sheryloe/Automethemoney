# Automethemoney

Automethemoney는 `GitHub-hosted Actions + Supabase + Vercel` 구조로 구현한 페이퍼 트레이딩 자동화 시스템 포트폴리오다.

- 핵심 목표: 자동 실행·기록·조회가 끊기지 않는 운영형 구조 구현
- 공개 페이지: GitHub Pages (`docs/index.html`)
- 핵심 콘텐츠: Step 1~5 구현 흐름 + 모델 A/B/C/D 이론 + 아키텍처 다이어그램 + 실운용 성과
- 디자인 톤: 하늘색 + 라이트 브라운

## 아키텍처 요약

- 실행 계층: GitHub-hosted Actions 스케줄 트리거
- 처리 계층: Batch에서 모델 A/B/C/D 실행
- 저장 계층: Supabase `model_setups`, `daily_model_pnl` 기록
- 조회 계층: Vercel 대시보드에서 모델 성과/상태 조회

## Step 1~5 구현 흐름

1. Step 1 문제 정의
- 수동 운영의 누락/추적 한계를 자동화 대상으로 정의
- 입력 → 처리 → 산출: 수동 이슈 → 자동화 요구 식별 → 주기 실행 조건 정의

2. Step 2 실행 파이프라인 설계
- Actions 스케줄로 배치 진입점을 고정해 자동 사이클 구성
- 입력 → 처리 → 산출: 스케줄 조건 → 배치 실행 → 사이클 실행 로그

3. Step 3 데이터 모델링
- 하트비트/셋업/포지션/일별 PnL 분리 저장 구조 설계
- 입력 → 처리 → 산출: 실행 결과 → 테이블별 저장 → 추적 가능한 상태 이력

4. Step 4 운영 UI 구성
- Supabase 기록을 운영 대시보드 지표로 매핑
- 입력 → 처리 → 산출: 저장 데이터 → 조회 렌더링 → 운영 판단 화면

5. Step 5 실운용 성과 추적
- 월간/누적 수익률 집계 기준으로 운영 지속 가능성 검토
- 입력 → 처리 → 산출: 실운용 결과 → 성과 집계 → 운영 판단 근거

## 모델 A/B/C/D 이론 요약 (Crypto 모델 스펙 기준)

- A: 크립토 레인지 리버전 플래너
- 과열 추격 대신 레인지 하단 재진입 구간 예측

- B: 크립토 리클레임 플래너
- 지지 회복과 재안착 구간의 진입/손절/목표가 산출

- C: 크립토 압축 돌파 플래너
- 변동성 수축 후 확장 구간 돌파 진입 계획

- D: 크립토 리셋 바운스 플래너
- 급락 후 안정화 구간의 되돌림 진입 계산

분업 운영 이유:
- 횡보(A), 회복(B), 돌파(C), 급락반등(D) 시나리오를 분리해 장세 적응력 확보

## 실제 구현 화면 정책

- 사용 파일:
  - `docs/assets/screenshots/auto-trading-cover.png`
  - `docs/assets/screenshots/auto-trading-dashboard.png`
- 표시 방식:
  - 이미지 삭제 없이 유지
  - 하단 30%를 일관되게 크롭해서 상단 핵심 영역만 노출

## 실제 운용 성과

- 실제 바이비트 계정 운용 기간: 1개월 진행 중
- 누적 수익률: 14%
- 3월 월간 수익: 15%
- 4월 월간 수익(현재 진행 중): 4%

## 배포 명령 (PowerShell)

```powershell
cd D:\Donggri_Platform\Automethemoney
git add docs/index.html README.md
git commit -m "docs: update landing with model A-D theory and cropped screenshots"
git push origin main
```
