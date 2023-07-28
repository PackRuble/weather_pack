/// Assert-function to check if latitude and longitude are correct.
void checkCoordinates(double latitude, double longitude) {
  assert(-90.0 <= latitude && latitude <= 90.0);
  assert(-180.0 <= longitude && longitude <= 180.0);
}
