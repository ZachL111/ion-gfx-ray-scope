# ion-gfx-ray-scope

`ion-gfx-ray-scope` packages a practical graphics exercise in Dart. The emphasis is on deterministic behavior, a small public API, and examples that explain the tradeoffs.

## How I Read Ion Gfx Ray Scope

The useful thing to inspect here is how the same score rule is represented in code, metadata, and examples. If those three pieces disagree, the audit script should make the drift visible.

## Main Behaviors

- Includes extended examples for render inputs, including `surge` and `degraded`.
- Documents stable output tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.
- Stores project constants and verification metadata in `metadata/project.json`.
- Adds a repository audit script that checks structure before running the language verifier.

## Problem Shape

The repository exists to keep a technical idea small enough to reason about. The implementation avoids external dependencies where possible, then uses fixtures to make changes easy to review.

## Repository Map

- `lib`: library code
- `tests`: verification harness
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands

## Internal Model

The core is a scoring model over demand, capacity, latency, risk, and weight. That keeps geometry data, layout fixtures, and render inputs in one explicit decision path. The threshold is 167, with risk penalty 5, latency penalty 3, and weight bonus 2. The Dart project uses a small library and assertion script, avoiding package dependencies for verification.

## How To Run It

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Scenario Walkthrough

`surge` is the first example I would inspect because it lands on the `accept` path with a score of 207. The broader file also keeps `degraded` at -49 and `surge` at 207, which gives the model a useful low-to-high spread.

## Validation

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Known Edges

The scoring model is simple by design. More domain-specific behavior should be added through explicit adapters or extra fixture classes rather than hidden constants.

## Follow-Up Work

- Split the scoring constants into a typed configuration object and validate it before use.
- Add a comparison mode that shows how decisions change when one signal is adjusted.
- Add a loader for `examples/extended_cases.csv` and promote selected cases into the language test suite.
- Add one more graphics fixture that focuses on a malformed or borderline input.

## Run It Locally

The only required setup is the local Dart toolchain. After cloning, stay in the repo root so fixture paths resolve correctly.
