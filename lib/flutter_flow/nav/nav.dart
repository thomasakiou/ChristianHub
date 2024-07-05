import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const HomePageWidget() : const OnboardingPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const HomePageWidget()
              : const OnboardingPageWidget(),
        ),
        FFRoute(
          name: 'OnboardingPage',
          path: '/onboardingPage',
          builder: (context, params) => const OnboardingPageWidget(),
        ),
        FFRoute(
          name: 'FrontPage',
          path: '/frontPage',
          builder: (context, params) => const FrontPageWidget(),
        ),
        FFRoute(
          name: 'PrayGroupPage',
          path: '/prayGroupPage',
          builder: (context, params) => const PrayGroupPageWidget(),
        ),
        FFRoute(
          name: 'DenominationPage',
          path: '/denominationPage',
          builder: (context, params) => const DenominationPageWidget(),
        ),
        FFRoute(
          name: 'StudyGroupPage',
          path: '/studyGroupPage',
          builder: (context, params) => const StudyGroupPageWidget(),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          builder: (context, params) => const ProfileWidget(),
        ),
        FFRoute(
          name: 'OldContent',
          path: '/oldContent',
          builder: (context, params) => OldContentWidget(
            contentRef: params.getParam(
              'contentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['old-testament', 'chapters'],
            ),
            contentParentRef: params.getParam(
              'contentParentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['old-testament'],
            ),
          ),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'OldTestament',
          path: '/oldTestament',
          builder: (context, params) => const OldTestamentWidget(),
        ),
        FFRoute(
          name: 'OldTestamentChapters',
          path: '/oldTestamentChapters',
          builder: (context, params) => OldTestamentChaptersWidget(
            chapterRef: params.getParam(
              'chapterRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['old-testament'],
            ),
            bookRef: params.getParam(
              'bookRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['old-testament'],
            ),
          ),
        ),
        FFRoute(
          name: 'OldUpdatePage',
          path: '/oldUpdatePage',
          builder: (context, params) => OldUpdatePageWidget(
            addTextRef: params.getParam(
              'addTextRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['old-testament', 'chapters'],
            ),
            parentRef: params.getParam(
              'parentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['old-testament'],
            ),
          ),
        ),
        FFRoute(
          name: 'HomePageUpdate',
          path: '/homePageUpdate',
          builder: (context, params) => const HomePageUpdateWidget(),
        ),
        FFRoute(
          name: 'OldTestamentUpdate',
          path: '/oldTestamentUpdate',
          builder: (context, params) => OldTestamentUpdateWidget(
            oldtestRef: params.getParam(
              'oldtestRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['old-testament'],
            ),
          ),
        ),
        FFRoute(
          name: 'OldTestamentChapterUpdate',
          path: '/oldTestamentChapterUpdate',
          builder: (context, params) => OldTestamentChapterUpdateWidget(
            chapterUpdate: params.getParam(
              'chapterUpdate',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['old-testament'],
            ),
          ),
        ),
        FFRoute(
          name: 'MessagesPage',
          path: '/messagesPage',
          builder: (context, params) => MessagesPageWidget(
            audiomsgRef: params.getParam(
              'audiomsgRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['messages'],
            ),
            msgRef: params.getParam(
              'msgRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['messages'],
            ),
          ),
        ),
        FFRoute(
          name: 'NewTestament',
          path: '/newTestament',
          builder: (context, params) => const NewTestamentWidget(),
        ),
        FFRoute(
          name: 'NewTestamentChapters',
          path: '/newTestamentChapters',
          builder: (context, params) => NewTestamentChaptersWidget(
            newChapterRef: params.getParam(
              'newChapterRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['new-testament'],
            ),
            newBookRef: params.getParam(
              'newBookRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['new-testament'],
            ),
          ),
        ),
        FFRoute(
          name: 'NewContent',
          path: '/newContent',
          builder: (context, params) => NewContentWidget(
            newContentRef: params.getParam(
              'newContentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['new-testament', 'new-chapters'],
            ),
            newContentParentRef: params.getParam(
              'newContentParentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['new-testament'],
            ),
          ),
        ),
        FFRoute(
          name: 'NewTestamentUpdate',
          path: '/newTestamentUpdate',
          builder: (context, params) => NewTestamentUpdateWidget(
            newtestRef: params.getParam(
              'newtestRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['new-testament'],
            ),
          ),
        ),
        FFRoute(
          name: 'NewTestamentChapterUpdate',
          path: '/newTestamentChapterUpdate',
          builder: (context, params) => NewTestamentChapterUpdateWidget(
            newchapterUpdate: params.getParam(
              'newchapterUpdate',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['new-testament'],
            ),
          ),
        ),
        FFRoute(
          name: 'NewUpdatePage',
          path: '/newUpdatePage',
          builder: (context, params) => NewUpdatePageWidget(
            addnewTextRef: params.getParam(
              'addnewTextRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['new-testament', 'new-chapters'],
            ),
            newparentRef: params.getParam(
              'newparentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['new-testament'],
            ),
          ),
        ),
        FFRoute(
          name: 'UpdateMessagesPage',
          path: '/updateMessagesPage',
          builder: (context, params) => UpdateMessagesPageWidget(
            msgCreateRef: params.getParam(
              'msgCreateRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['messages'],
            ),
          ),
        ),
        FFRoute(
          name: 'AllPreachers',
          path: '/allPreachers',
          builder: (context, params) => AllPreachersWidget(
            audiomsgRef: params.getParam(
              'audiomsgRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['messages'],
            ),
          ),
        ),
        FFRoute(
          name: 'Devotionals',
          path: '/devotionals',
          builder: (context, params) => DevotionalsWidget(
            devotionRef: params.getParam(
              'devotionRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['devotional'],
            ),
            devcontentRef: params.getParam(
              'devcontentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['devotional', 'content'],
            ),
          ),
        ),
        FFRoute(
          name: 'UpdateDevotional',
          path: '/updateDevotional',
          builder: (context, params) => UpdateDevotionalWidget(
            devRef: params.getParam(
              'devRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['devotional'],
            ),
            devcontRef: params.getParam(
              'devcontRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['devotional', 'content'],
            ),
          ),
        ),
        FFRoute(
          name: 'chat_2_main',
          path: '/chat2Main',
          builder: (context, params) => const Chat2MainWidget(),
        ),
        FFRoute(
          name: 'char_2_details',
          path: '/char2Details',
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => Char2DetailsWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'image_Details',
          path: '/imageDetails',
          builder: (context, params) => const ImageDetailsWidget(),
        ),
        FFRoute(
          name: 'chat_2_InviteUsers',
          path: '/chat2InviteUsers',
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2InviteUsersWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'AiPage',
          path: '/aiPage',
          builder: (context, params) => const AiPageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onboardingPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
