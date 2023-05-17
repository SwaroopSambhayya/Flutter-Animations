import 'package:interpolate_animated/interpolate_animated.dart';

getInterPolateY(y, index, cardHeight, position, isBottom, isAppearing) {
  double yVal = interpolate(y,
      inputRange: [0, 0.00001 + index * cardHeight],
      outputRange: [0, -index * cardHeight],
      extrapolateRight: Extrapolate.clamp);
  double pos = interpolate(position,
      inputRange: [isBottom, isAppearing],
      outputRange: [0, -cardHeight / 4],
      extrapolate: Extrapolate.clamp);

  return yVal + pos + y;
}

getInterPolatePos(position, cardHeight, isBottom, isAppearing) {
  double pos = interpolate(position,
      inputRange: [isBottom, isAppearing],
      outputRange: [0, -cardHeight / 4],
      extrapolate: Extrapolate.clamp);
  return pos;
}

getAnimatedScale(position, isDisappearing, isTop, isBottom, isAppearing) {
  double scale = interpolate(
    position,
    inputRange: [isDisappearing, isTop, isBottom, isAppearing],
    outputRange: [0.5, 1, 1, 0.5],
    extrapolate: Extrapolate.clamp,
  );
  return scale;
}

getAnimatedOpacity(position, isDisappearing, isTop, isBottom, isAppearing) {
  return interpolate(position,
      inputRange: [isDisappearing, isTop, isBottom, isAppearing],
      outputRange: [0.5, 1, 1, 0.5],
      extrapolate: Extrapolate.clamp);
}
