class FeedbackForm
{

  String _name;

  FeedbackForm(this._name);

  // Method to make GET parameters.
  String toParams() =>
      "?name=$_name";

}