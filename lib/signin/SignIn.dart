import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:testdrive/utils/GlobalUtils.dart' as Utils;
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
  final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
//  final FirebaseUser user = (await _auth.signInWithCredential(credential)) as FirebaseUser;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  assert(user.email != null);
  print(user.email);
  Utils.setStoreString(Utils.KEY_EMAIL_ID, user.email);
  assert(user.displayName != null);
  Utils.setStoreString(Utils.KEY_USER_NAME, user.displayName);
  print(user.displayName);
  assert(user.photoUrl != null);
  Utils.setStoreString(Utils.KEY_PROFILE_IMAGE_URL, user.photoUrl);

  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle() async{
  await googleSignIn.signOut();

  print("User Sign Out");
}