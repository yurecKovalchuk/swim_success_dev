# Swim Success — Flutter Test Task

A Flutter application with two screens: a **Pace Selector** for setting your freestyle swim pace and detecting your swimmer level, and a **User List** that fetches and displays users from a REST API.

---

## Running the app

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

---

## State Management — BLoC (Cubit)

I chose **`flutter_bloc`** with the **Cubit** variant for both features.

**Why BLoC over alternatives:**

- **vs setState / ValueNotifier** — too imperative for async flows; error and loading states become scattered across the widget tree.
- **vs Riverpod** — powerful, but adds conceptual overhead (providers, refs, notifiers) that isn't justified for a two-screen app. BLoC is the more common choice in production Flutter teams.
- **vs plain BLoC (events)** — Cubit drops the event boilerplate while keeping the same predictable `state → emit` model. For screens without complex event chaining, Cubit is the right level of abstraction.

**What BLoC gives concretely here:**

- `PaceSelectorCubit` owns all pace logic (minutes, seconds, swimmer level derivation, POST request) — the screen is a pure view.
- `UsersCubit` owns fetch, search filtering, and refresh — the list widget reads state, nothing else.
- Both cubits are independently testable without touching Flutter at all.

---

## Project Structure

Feature-first layout: each feature is self-contained with its own BLoC, screen, and widgets. Shared infrastructure lives outside features.

```
lib/
├── app/
│   ├── app.dart                  # MaterialApp, theme, locale setup
│   ├── app_shell.dart            # AutoTabsScaffold + floating glass nav bar
│   ├── app_router/               # auto_route config and generated router
│   └── di/
│       └── injector.dart         # get_it registrations
│
├── core/
│   ├── constants/
│   │   └── api_endpoints.dart    # base URL and path constants
│   ├── extensions/
│   │   └── l10n_extension.dart   # BuildContext.l10n shorthand
│   └── network/
│       └── network_exception.dart # typed network error wrapper
│
├── data/
│   ├── network/
│   │   └── dio_client.dart       # Dio factory with timeouts and headers
│   └── repositories/
│       ├── pace_repository.dart  # POST /posts implementation
│       └── users_repository.dart # GET /users implementation
│
├── domain/
│   ├── models/
│   │   ├── pace_request.dart     # Freezed model — { pace_seconds }
│   │   └── user.dart             # Freezed models — User, Address, Company
│   └── repositories/
│       ├── i_pace_repository.dart
│       └── i_users_repository.dart
│
├── features/
│   ├── pace_selector/
│   │   ├── bloc/
│   │   │   ├── pace_selector_cubit.dart
│   │   │   └── pace_selector_state.dart
│   │   ├── models/
│   │   │   └── swimmer_level.dart   # enum + detection logic
│   │   ├── screen/
│   │   │   └── pace_selector_screen.dart
│   │   └── widgets/
│   │       ├── min_sec_input.dart       # up/down spinners + tap-to-edit
│   │       └── swimmer_level_badge.dart # animated pill badge
│   │
│   └── users/
│       ├── bloc/
│       │   ├── users_cubit.dart
│       │   └── users_state.dart
│       ├── screen/
│       │   ├── users_list_screen.dart
│       │   └── user_detail_screen.dart
│       └── widgets/
│           └── user_list_tile.dart
│
└── l10n/                         # English and Ukrainian localizations
```

**Key decisions:**

- **Repository interfaces in `domain/`** — cubits depend on abstractions (`IPaceRepository`, `IUsersRepository`), not concrete classes. get_it resolves the real implementations at runtime, making them swappable for mocks in tests.
- **`data/` vs `domain/`** — Freezed models live in `domain/` (they represent business entities), HTTP calls live in `data/` (infrastructure detail).
- **`app_shell.dart`** — the floating glass nav bar is isolated here and not mixed into individual screens.

---

## Swimmer Level Ranges

Levels are derived from the total pace in seconds (MIN × 60 + SEC):

| Level        | Pace per 100 m  | Total seconds |
|--------------|-----------------|---------------|
| Elite        | < 1:30          | < 90 s        |
| Advanced     | 1:30 – 1:59     | 90 – 119 s    |
| Intermediate | 2:00 – 2:29     | 120 – 149 s   |
| Beginner     | ≥ 2:30          | ≥ 150 s       |

These ranges are loosely based on recreational freestyle benchmarks. The detection logic lives in `SwimmerLevel.fromPace()` (`lib/features/pace_selector/models/swimmer_level.dart`) — a pure function with no Flutter dependency, trivial to unit test.

---

## What I Would Do Differently With More Time

**Testing**
- Unit tests for both cubits (state transitions, error paths).
- Unit tests for `SwimmerLevel.fromPace()` covering all boundaries.
- Widget tests for `MinSecInput` (arrow taps, direct text entry, slider sync).

**Pace Selector**
- Add ~500 ms debounce on slider changes and trigger the POST automatically, not only on button press — as hinted in the task requirements.
- Haptic feedback on swimmer level change.

**User List**
- Persist the user list to a local cache (e.g. `drift` or `hive`) so the screen is usable offline.
- Expand search to also filter by phone and company name.

**Architecture**
- Replace get_it manual registration with a generated solution (e.g. `injectable`) to eliminate boilerplate and reduce registration errors.
- Add an `Either`-based result type (e.g. `fpdart`) in repository return types instead of throwing exceptions — makes error handling at the cubit layer more explicit.

**UX**
- Skeleton loading placeholders instead of a centered spinner on the user list.
- Transition animation between the list and detail screen.
