String capitalizeFirstCharacter(String featureName) {
  if (featureName.isEmpty) return featureName;
  return featureName[0].toUpperCase() + featureName.substring(1);
}
