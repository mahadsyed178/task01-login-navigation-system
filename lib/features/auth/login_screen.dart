// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isPasswordVisible = false;
//   bool _isLoading = false;
//
//   static const Color primaryBlue = Color(0xFF1B2FC2);
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _handleSignIn() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() => _isLoading = true);
//       await Future.delayed(const Duration(seconds: 2)); // simulate API call
//       setState(() => _isLoading = false);
//       // Navigate to home screen
//       // Navigator.pushReplacement(context,
//       //   MaterialPageRoute(builder: (_) => const HomeScreen()));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 60),
//
//                 // ---- Logo ----
//                 Center(child: _buildLogo()),
//
//                 const SizedBox(height: 48),
//
//                 // ---- Title ----
//                 const Text(
//                   'Login to your Account',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black87,
//                   ),
//                 ),
//
//                 const SizedBox(height: 24),
//
//                 // ---- Email Field ----
//                 _buildEmailField(),
//
//                 const SizedBox(height: 16),
//
//                 // ---- Password Field ----
//                 _buildPasswordField(),
//
//                 const SizedBox(height: 28),
//
//                 // ---- Sign In Button ----
//                 _buildSignInButton(),
//
//                 const SizedBox(height: 32),
//
//                 // ---- Or sign in with ----
//                 _buildDivider(),
//
//                 const SizedBox(height: 24),
//
//                 // ---- Social Buttons ----
//                 _buildSocialButtons(),
//
//                 const SizedBox(height: 48),
//
//                 // ---- Sign Up Link ----
//                 _buildSignUpRow(),
//
//                 const SizedBox(height: 24),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // -----------------------------------------------
//   // LOGO WIDGET
//   // -----------------------------------------------
//   Widget _buildLogo() {
//     return Column(
//       children: [
//         RichText(
//           text: const TextSpan(
//             children: [
//               TextSpan(
//                 text: 'ci',
//                 style: TextStyle(
//                   color: primaryBlue,
//                   fontSize: 28,
//                   fontWeight: FontWeight.w400,
//                   letterSpacing: 1.0,
//                 ),
//               ),
//               TextSpan(
//                 text: 'gn',
//                 style: TextStyle(
//                   color: primaryBlue,
//                   fontSize: 28,
//                   fontWeight: FontWeight.w400,
//                   letterSpacing: 1.0,
//                 ),
//               ),
//               TextSpan(
//                 text: 'ifi',
//                 style: TextStyle(
//                   color: primaryBlue,
//                   fontSize: 28,
//                   fontWeight: FontWeight.w400,
//                   letterSpacing: 1.0,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 6),
//         // Dots below logo
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(5, (index) {
//             return Container(
//               margin: const EdgeInsets.symmetric(horizontal: 2),
//               width: index == 2 ? 7 : 5,
//               height: index == 2 ? 7 : 5,
//               decoration: BoxDecoration(
//                 color: primaryBlue.withOpacity(index == 2 ? 1.0 : 0.5),
//                 shape: BoxShape.circle,
//               ),
//             );
//           }),
//         ),
//       ],
//     );
//   }
//
//   // -----------------------------------------------
//   // EMAIL FIELD
//   // -----------------------------------------------
//   Widget _buildEmailField() {
//     return TextFormField(
//       controller: _emailController,
//       keyboardType: TextInputType.emailAddress,
//       style: const TextStyle(fontSize: 14, color: Colors.black87),
//       decoration: InputDecoration(
//         hintText: 'Email',
//         hintStyle: TextStyle(
//           color: Colors.grey.shade400,
//           fontSize: 14,
//         ),
//         filled: true,
//         fillColor: Colors.white,
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 16,
//           vertical: 16,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: Colors.grey.shade300),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: Colors.grey.shade300),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: primaryBlue, width: 1.5),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.red),
//         ),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter your email';
//         }
//         if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//           return 'Please enter a valid email';
//         }
//         return null;
//       },
//     );
//   }
//
//   // -----------------------------------------------
//   // PASSWORD FIELD
//   // -----------------------------------------------
//   Widget _buildPasswordField() {
//     return TextFormField(
//       controller: _passwordController,
//       obscureText: !_isPasswordVisible,
//       style: const TextStyle(fontSize: 14, color: Colors.black87),
//       decoration: InputDecoration(
//         hintText: 'Password',
//         hintStyle: TextStyle(
//           color: Colors.grey.shade400,
//           fontSize: 14,
//         ),
//         filled: true,
//         fillColor: Colors.white,
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 16,
//           vertical: 16,
//         ),
//         suffixIcon: IconButton(
//           icon: Icon(
//             _isPasswordVisible
//                 ? Icons.visibility_outlined
//                 : Icons.visibility_off_outlined,
//             color: Colors.grey.shade400,
//             size: 20,
//           ),
//           onPressed: () {
//             setState(() => _isPasswordVisible = !_isPasswordVisible);
//           },
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: Colors.grey.shade300),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: Colors.grey.shade300),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: primaryBlue, width: 1.5),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.red),
//         ),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter your password';
//         }
//         if (value.length < 6) {
//           return 'Password must be at least 6 characters';
//         }
//         return null;
//       },
//     );
//   }
//
//   // -----------------------------------------------
//   // SIGN IN BUTTON
//   // -----------------------------------------------
//   Widget _buildSignInButton() {
//     return SizedBox(
//       width: double.infinity,
//       height: 52,
//       child: ElevatedButton(
//         onPressed: _isLoading ? null : _handleSignIn,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: primaryBlue,
//           foregroundColor: Colors.white,
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           disabledBackgroundColor: primaryBlue.withOpacity(0.6),
//         ),
//         child: _isLoading
//             ? const SizedBox(
//           width: 22,
//           height: 22,
//           child: CircularProgressIndicator(
//             color: Colors.white,
//             strokeWidth: 2.5,
//           ),
//         )
//             : const Text(
//           'Sign in',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             letterSpacing: 0.5,
//           ),
//         ),
//       ),
//     );
//   }
//
//   // -----------------------------------------------
//   // DIVIDER
//   // -----------------------------------------------
//   Widget _buildDivider() {
//     return Row(
//       children: [
//         Expanded(
//           child: Divider(
//             color: Colors.grey.shade300,
//             thickness: 1,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           child: Text(
//             '- Or sign in with -',
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey.shade400,
//             ),
//           ),
//         ),
//         Expanded(
//           child: Divider(
//             color: Colors.grey.shade300,
//             thickness: 1,
//           ),
//         ),
//       ],
//     );
//   }
//
//   // -----------------------------------------------
//   // SOCIAL BUTTONS
//   // -----------------------------------------------
//   Widget _buildSocialButtons() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         // Google
//         _buildSocialButton(
//           onTap: () {},
//           child: _GoogleIcon(),
//         ),
//
//         const SizedBox(width: 20),
//
//         // Facebook
//         _buildSocialButton(
//           onTap: () {},
//           child: const Icon(
//             Icons.facebook,
//             color: Color(0xFF1877F2),
//             size: 26,
//           ),
//         ),
//
//         const SizedBox(width: 20),
//
//         // Twitter / X
//         _buildSocialButton(
//           onTap: () {},
//           child: const Icon(
//             Icons.close, // Replace with twitter icon from font package
//             color: Color(0xFF1DA1F2),
//             size: 24,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildSocialButton({
//     required VoidCallback onTap,
//     required Widget child,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         width: 64,
//         height: 64,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: Colors.grey.shade200),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.shade100,
//               blurRadius: 4,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Center(child: child),
//       ),
//     );
//   }
//
//   // -----------------------------------------------
//   // SIGN UP ROW
//   // -----------------------------------------------
//   Widget _buildSignUpRow() {
//     return Center(
//       child: RichText(
//         text: TextSpan(
//           text: "Don't have an account? ",
//           style: TextStyle(
//             fontSize: 13,
//             color: Colors.grey.shade500,
//           ),
//           children: [
//             WidgetSpan(
//               child: GestureDetector(
//                 onTap: () {
//                   // Navigator.push(context,
//                   //   MaterialPageRoute(builder: (_) => const SignUpScreen()));
//                 },
//                 child: const Text(
//                   'Sign up',
//                   style: TextStyle(
//                     fontSize: 13,
//                     color: primaryBlue,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // -----------------------------------------------
// // GOOGLE ICON WIDGET
// // -----------------------------------------------
// class _GoogleIcon extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 26,
//       height: 26,
//       child: CustomPaint(
//         painter: _GooglePainter(),
//       ),
//     );
//   }
// }
//
// class _GooglePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..style = PaintingStyle.fill;
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = size.width / 2;
//
//     // Red arc
//     paint.color = const Color(0xFFEA4335);
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       -1.57, 1.57, true, paint,
//     );
//
//     // Blue arc
//     paint.color = const Color(0xFF4285F4);
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       0, 1.57, true, paint,
//     );
//
//     // Yellow arc
//     paint.color = const Color(0xFFFBBC05);
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       1.57, 1.57, true, paint,
//     );
//
//     // Green arc
//     paint.color = const Color(0xFF34A853);
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       3.14, 1.57, true, paint,
//     );
//
//     // White center
//     paint.color = Colors.white;
//     canvas.drawCircle(center, radius * 0.6, paint);
//
//     // Blue G bar
//     paint.color = const Color(0xFF4285F4);
//     canvas.drawRect(
//       Rect.fromLTWH(center.dx, center.dy - 3, radius, 6),
//       paint,
//     );
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }









// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   // Form key for validation
//   final _formKey = GlobalKey<FormState>();
//
//   // Controllers
//   final _emailController    = TextEditingController();
//   final _passwordController = TextEditingController();
//
//   // State
//   bool _isPasswordVisible = false;
//   bool _isLoading         = false;
//
//   static const Color primaryBlue = Color(0xFF1B2FC2);
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   // -----------------------------------------------
//   // LOGIN HANDLER
//   // -----------------------------------------------
//   Future<void> _handleLogin() async {
//     // Close keyboard
//     FocusScope.of(context).unfocus();
//
//     if (_formKey.currentState!.validate()) {
//       setState(() => _isLoading = true);
//
//       // Simulate API call
//       await Future.delayed(const Duration(seconds: 2));
//
//       setState(() => _isLoading = false);
//
//       // Show success message
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: const Text('Login Successful!'),
//             backgroundColor: Colors.green.shade600,
//             behavior: SnackBarBehavior.floating,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//         );
//       }
//
//       // Navigate to home
//       // Navigator.pushReplacement(context,
//       //   MaterialPageRoute(builder: (_) => const HomeScreen()));
//     }
//   }
//
//   // -----------------------------------------------
//   // FORGOT PASSWORD HANDLER
//   // -----------------------------------------------
//   void _handleForgotPassword() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//         title: const Text(
//           'Forgot Password?',
//           style: TextStyle(
//             color: primaryBlue,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         content: const Text(
//           'Enter your email address and we will send you a link to reset your password.',
//           style: TextStyle(color: Colors.black54, fontSize: 13),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text(
//               'Cancel',
//               style: TextStyle(color: Colors.grey),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: const Text('Password reset link sent!'),
//                   backgroundColor: primaryBlue,
//                   behavior: SnackBarBehavior.floating,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: primaryBlue,
//               foregroundColor: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: const Text('Send Link'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // -----------------------------------------------
//   // BUILD
//   // -----------------------------------------------
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 28.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 40),
//
//                   // ---- Logo ----
//                   Center(child: _buildLogo()),
//
//                   const SizedBox(height: 40),
//
//                   // ---- Welcome Text ----
//                   _buildWelcomeText(),
//
//                   const SizedBox(height: 32),
//
//                   // ---- Email Field ----
//                   _buildLabel('Email Address'),
//                   const SizedBox(height: 8),
//                   _buildEmailField(),
//
//                   const SizedBox(height: 20),
//
//                   // ---- Password Field ----
//                   _buildPasswordHeader(),
//                   const SizedBox(height: 8),
//                   _buildPasswordField(),
//
//                   const SizedBox(height: 32),
//
//                   // ---- Login Button ----
//                   _buildLoginButton(),
//
//                   const SizedBox(height: 40),
//
//                   // ---- Sign Up Row ----
//                   _buildSignUpRow(),
//
//                   const SizedBox(height: 30),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // -----------------------------------------------
//   // LOGO
//   // -----------------------------------------------
//   Widget _buildLogo() {
//     return Column(
//       children: [
//         // Icon circle
//         Container(
//           width: 70,
//           height: 70,
//           decoration: BoxDecoration(
//             color: primaryBlue.withOpacity(0.1),
//             shape: BoxShape.circle,
//           ),
//           child: const Icon(
//             Icons.lock_outline_rounded,
//             color: primaryBlue,
//             size: 34,
//           ),
//         ),
//         const SizedBox(height: 16),
//         const Text(
//           'cignifi',
//           style: TextStyle(
//             color: primaryBlue,
//             fontSize: 28,
//             fontWeight: FontWeight.w600,
//             letterSpacing: 1.5,
//           ),
//         ),
//         const SizedBox(height: 6),
//         // Dots
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(5, (index) {
//             return Container(
//               margin: const EdgeInsets.symmetric(horizontal: 2),
//               width: index == 2 ? 7 : 5,
//               height: index == 2 ? 7 : 5,
//               decoration: BoxDecoration(
//                 color: primaryBlue.withOpacity(
//                   index == 2 ? 1.0 : 0.4,
//                 ),
//                 shape: BoxShape.circle,
//               ),
//             );
//           }),
//         ),
//       ],
//     );
//   }
//
//   // -----------------------------------------------
//   // WELCOME TEXT
//   // -----------------------------------------------
//   Widget _buildWelcomeText() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Welcome Back 👋',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.w700,
//             color: Colors.black87,
//           ),
//         ),
//         const SizedBox(height: 6),
//         Text(
//           'Login to your account to continue',
//           style: TextStyle(
//             fontSize: 13,
//             color: Colors.grey.shade500,
//           ),
//         ),
//       ],
//     );
//   }
//
//   // -----------------------------------------------
//   // FIELD LABEL
//   // -----------------------------------------------
//   Widget _buildLabel(String text) {
//     return Text(
//       text,
//       style: const TextStyle(
//         fontSize: 13,
//         fontWeight: FontWeight.w500,
//         color: Colors.black87,
//       ),
//     );
//   }
//
//   // -----------------------------------------------
//   // PASSWORD ROW (label + forgot password)
//   // -----------------------------------------------
//   Widget _buildPasswordHeader() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _buildLabel('Password'),
//
//         // ---- Forgot Password Text ----
//         // Using TextButton which is the modern replacement
//         // for deprecated FlatButton
//         TextButton(
//           onPressed: _handleForgotPassword,
//           style: TextButton.styleFrom(
//             padding: EdgeInsets.zero,
//             minimumSize: Size.zero,
//             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//           ),
//           child: const Text(
//             'Forgot Password?',
//             style: TextStyle(
//               fontSize: 13,
//               color: primaryBlue,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   // -----------------------------------------------
//   // EMAIL TEXT FORM FIELD
//   // -----------------------------------------------
//   Widget _buildEmailField() {
//     return TextFormField(
//       controller: _emailController,
//       keyboardType: TextInputType.emailAddress,
//       textInputAction: TextInputAction.next,
//       style: const TextStyle(
//         fontSize: 14,
//         color: Colors.black87,
//       ),
//       decoration: _inputDecoration(
//         hint: 'Enter your email',
//         prefixIcon: Icons.email_outlined,
//       ),
//       validator: (value) {
//         if (value == null || value.trim().isEmpty) {
//           return 'Email is required';
//         }
//         final emailRegex =
//         RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
//         if (!emailRegex.hasMatch(value.trim())) {
//           return 'Please enter a valid email address';
//         }
//         return null;
//       },
//     );
//   }
//
//   // -----------------------------------------------
//   // PASSWORD TEXT FORM FIELD
//   // -----------------------------------------------
//   Widget _buildPasswordField() {
//     return TextFormField(
//       controller: _passwordController,
//       obscureText: !_isPasswordVisible,
//       textInputAction: TextInputAction.done,
//       onFieldSubmitted: (_) => _handleLogin(),
//       style: const TextStyle(
//         fontSize: 14,
//         color: Colors.black87,
//       ),
//       decoration: _inputDecoration(
//         hint: 'Enter your password',
//         prefixIcon: Icons.lock_outline,
//         suffixIcon: IconButton(
//           icon: Icon(
//             _isPasswordVisible
//                 ? Icons.visibility_outlined
//                 : Icons.visibility_off_outlined,
//             color: Colors.grey.shade400,
//             size: 20,
//           ),
//           onPressed: () {
//             setState(
//                   () => _isPasswordVisible = !_isPasswordVisible,
//             );
//           },
//         ),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Password is required';
//         }
//         if (value.length < 6) {
//           return 'Password must be at least 6 characters';
//         }
//         return null;
//       },
//     );
//   }
//
//   // -----------------------------------------------
//   // INPUT DECORATION HELPER
//   // -----------------------------------------------
//   InputDecoration _inputDecoration({
//     required String hint,
//     required IconData prefixIcon,
//     Widget? suffixIcon,
//   }) {
//     return InputDecoration(
//       hintText: hint,
//       hintStyle: TextStyle(
//         color: Colors.grey.shade400,
//         fontSize: 13,
//       ),
//       prefixIcon: Icon(
//         prefixIcon,
//         color: Colors.grey.shade400,
//         size: 20,
//       ),
//       suffixIcon: suffixIcon,
//       filled: true,
//       fillColor: Colors.grey.shade50,
//       contentPadding: const EdgeInsets.symmetric(
//         horizontal: 16,
//         vertical: 16,
//       ),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: BorderSide(color: Colors.grey.shade200),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: BorderSide(color: Colors.grey.shade200),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: const BorderSide(
//           color: primaryBlue,
//           width: 1.5,
//         ),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: const BorderSide(color: Colors.red),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: const BorderSide(color: Colors.red, width: 1.5),
//       ),
//     );
//   }
//
//   // -----------------------------------------------
//   // LOGIN BUTTON (FlatButton equivalent)
//   // -----------------------------------------------
//   Widget _buildLoginButton() {
//     return SizedBox(
//       width: double.infinity,
//       height: 52,
//       // TextButton is the modern FlatButton replacement
//       child: TextButton(
//         onPressed: _isLoading ? null : _handleLogin,
//         style: TextButton.styleFrom(
//           backgroundColor: primaryBlue,
//           foregroundColor: Colors.white,
//           disabledBackgroundColor: primaryBlue.withOpacity(0.5),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         child: _isLoading
//             ? const SizedBox(
//           width: 22,
//           height: 22,
//           child: CircularProgressIndicator(
//             color: Colors.white,
//             strokeWidth: 2.5,
//           ),
//         )
//             : const Text(
//           'Login',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             letterSpacing: 0.8,
//           ),
//         ),
//       ),
//     );
//   }
//
//   // -----------------------------------------------
//   // SIGN UP ROW
//   // -----------------------------------------------
//   Widget _buildSignUpRow() {
//     return Center(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "Don't have an account? ",
//             style: TextStyle(
//               fontSize: 13,
//               color: Colors.grey.shade500,
//             ),
//           ),
//           // FlatButton style sign up
//           TextButton(
//             onPressed: () {
//               // Navigator.push(context,
//               //   MaterialPageRoute(
//               //     builder: (_) => const SignUpScreen()));
//             },
//             style: TextButton.styleFrom(
//               padding: EdgeInsets.zero,
//               minimumSize: Size.zero,
//               tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//             ),
//             child: const Text(
//               'Sign Up',
//               style: TextStyle(
//                 fontSize: 13,
//                 color: primaryBlue,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




//
// import 'package:basic_auth_navigation_app/features/home/home_screen.dart';
// import 'package:flutter/material.dart';
//
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   // Form key for validation
//   final _formKey = GlobalKey<FormState>();
//
//   // Controllers
//   final _emailController    = TextEditingController();
//   final _passwordController = TextEditingController();
//
//   // Focus nodes
//   final _emailFocus    = FocusNode();
//   final _passwordFocus = FocusNode();
//
//   // State
//   bool _isPasswordVisible = false;
//   bool _isLoading         = false;
//
//   // Validation state tracking
//   bool _emailTouched    = false;
//   bool _passwordTouched = false;
//
//   static const Color primaryBlue  = Color(0xFF1B2FC2);
//   static const Color errorRed     = Color(0xFFE53935);
//   static const Color successGreen = Color(0xFF43A047);
//
//   @override
//   void initState() {
//     super.initState();
//     // Track when fields are touched
//     _emailFocus.addListener(() {
//       if (!_emailFocus.hasFocus && !_emailTouched) {
//         setState(() => _emailTouched = true);
//       }
//     });
//     _passwordFocus.addListener(() {
//       if (!_passwordFocus.hasFocus && !_passwordTouched) {
//         setState(() => _passwordTouched = true);
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _emailFocus.dispose();
//     _passwordFocus.dispose();
//     super.dispose();
//   }
//
//   // -----------------------------------------------
//   // VALIDATION HELPERS
//   // -----------------------------------------------
//
//   // Email validation
//   String? _validateEmail(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Email address is required';
//     }
//     if (value.trim().length < 5) {
//       return 'Email is too short';
//     }
//     final emailRegex = RegExp(
//       r'^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$',
//     );
//     if (!emailRegex.hasMatch(value.trim())) {
//       return 'Please enter a valid email address';
//     }
//     if (value.contains('..')) {
//       return 'Email cannot contain consecutive dots';
//     }
//     return null;
//   }
//
//   // Password validation
//   String? _validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Password is required';
//     }
//     if (value.length < 6) {
//       return 'Password must be at least 6 characters';
//     }
//     if (value.length > 50) {
//       return 'Password is too long';
//     }
//     if (value.contains(' ')) {
//       return 'Password cannot contain spaces';
//     }
//     return null;
//   }
//
//   // Check if email is valid (for live feedback)
//   bool get _isEmailValid =>
//       _validateEmail(_emailController.text) == null &&
//           _emailController.text.isNotEmpty;
//
//   // Check if password is valid (for live feedback)
//   bool get _isPasswordValid =>
//       _validatePassword(_passwordController.text) == null &&
//           _passwordController.text.isNotEmpty;
//
//   // -----------------------------------------------
//   // LOGIN HANDLER
//   // -----------------------------------------------
//   Future<void> _handleLogin() async {
//     // Mark all fields as touched
//     setState(() {
//       _emailTouched    = true;
//       _passwordTouched = true;
//     });
//
//     FocusScope.of(context).unfocus();
//
//     if (_formKey.currentState!.validate()) {
//       setState(() => _isLoading = true);
//
//       // Simulate API call
//       await Future.delayed(const Duration(seconds: 2));
//
//       setState(() => _isLoading = false);
//
//       if (mounted) {
//         // Navigate to home with slide transition
//         Navigator.pushReplacement(
//           context,
//           PageRouteBuilder(
//             pageBuilder: (context, animation, secondaryAnimation) =>
//                 HomeScreen(
//                   userEmail: _emailController.text.trim(),
//                 ),
//             transitionsBuilder:
//                 (context, animation, secondaryAnimation, child) {
//               return SlideTransition(
//                 position: Tween<Offset>(
//                   begin: const Offset(1.0, 0.0),
//                   end: Offset.zero,
//                 ).animate(CurvedAnimation(
//                   parent: animation,
//                   curve: Curves.easeInOut,
//                 )),
//                 child: child,
//               );
//             },
//             transitionDuration: const Duration(milliseconds: 400),
//           ),
//         );
//       }
//     } else {
//       // Show error snackbar if validation fails
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: const Row(
//               children: [
//                 Icon(Icons.error_outline, color: Colors.white, size: 20),
//                 SizedBox(width: 10),
//                 Text('Please fix the errors below'),
//               ],
//             ),
//             backgroundColor: errorRed,
//             behavior: SnackBarBehavior.floating,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//         );
//       }
//     }
//   }
//
//   // -----------------------------------------------
//   // FORGOT PASSWORD HANDLER
//   // -----------------------------------------------
//   void _handleForgotPassword() {
//     final forgotEmailController = TextEditingController(
//       text: _emailController.text,
//     );
//     final forgotFormKey = GlobalKey<FormState>();
//
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//         title: const Text(
//           'Forgot Password?',
//           style: TextStyle(
//             color: primaryBlue,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         content: Form(
//           key: forgotFormKey,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 'Enter your email and we will send a reset link.',
//                 style: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 13,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: forgotEmailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   hintText: 'Enter your email',
//                   hintStyle: TextStyle(
//                     color: Colors.grey.shade400,
//                     fontSize: 13,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.email_outlined,
//                     color: Colors.grey.shade400,
//                     size: 20,
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey.shade50,
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 14,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(color: Colors.grey.shade200),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(color: Colors.grey.shade200),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(
//                       color: primaryBlue,
//                       width: 1.5,
//                     ),
//                   ),
//                   errorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(color: errorRed),
//                   ),
//                 ),
//                 validator: _validateEmail,
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text(
//               'Cancel',
//               style: TextStyle(color: Colors.grey),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               if (forgotFormKey.currentState!.validate()) {
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: const Row(
//                       children: [
//                         Icon(Icons.check_circle_outline,
//                             color: Colors.white, size: 20),
//                         SizedBox(width: 10),
//                         Text('Password reset link sent!'),
//                       ],
//                     ),
//                     backgroundColor: successGreen,
//                     behavior: SnackBarBehavior.floating,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 );
//               }
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: primaryBlue,
//               foregroundColor: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: const Text('Send Link'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // -----------------------------------------------
//   // BUILD
//   // -----------------------------------------------
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 28.0),
//             child: Form(
//               key: _formKey,
//               autovalidateMode: AutovalidateMode.disabled,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 40),
//
//                   // ---- Logo ----
//                   Center(child: _buildLogo()),
//                   const SizedBox(height: 40),
//
//                   // ---- Welcome Text ----
//                   _buildWelcomeText(),
//                   const SizedBox(height: 32),
//
//                   // ---- Email Field ----
//                   _buildLabel('Email Address'),
//                   const SizedBox(height: 8),
//                   _buildEmailField(),
//
//                   const SizedBox(height: 20),
//
//                   // ---- Password Field ----
//                   _buildPasswordHeader(),
//                   const SizedBox(height: 8),
//                   _buildPasswordField(),
//
//                   const SizedBox(height: 12),
//
//                   // ---- Validation Summary ----
//                   _buildValidationSummary(),
//
//                   const SizedBox(height: 24),
//
//                   // ---- Login Button ----
//                   _buildLoginButton(),
//
//                   const SizedBox(height: 40),
//
//                   // ---- Sign Up Row ----
//                   _buildSignUpRow(),
//
//                   const SizedBox(height: 30),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // -----------------------------------------------
//   // LOGO
//   // -----------------------------------------------
//   Widget _buildLogo() {
//     return Column(
//       children: [
//         Container(
//           width: 70,
//           height: 70,
//           decoration: BoxDecoration(
//             color: primaryBlue.withOpacity(0.1),
//             shape: BoxShape.circle,
//           ),
//           child: const Icon(
//             Icons.lock_outline_rounded,
//             color: primaryBlue,
//             size: 34,
//           ),
//         ),
//         const SizedBox(height: 16),
//         const Text(
//           'cignifi',
//           style: TextStyle(
//             color: primaryBlue,
//             fontSize: 28,
//             fontWeight: FontWeight.w600,
//             letterSpacing: 1.5,
//           ),
//         ),
//         const SizedBox(height: 6),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(5, (index) {
//             return Container(
//               margin: const EdgeInsets.symmetric(horizontal: 2),
//               width: index == 2 ? 7 : 5,
//               height: index == 2 ? 7 : 5,
//               decoration: BoxDecoration(
//                 color: primaryBlue.withOpacity(
//                   index == 2 ? 1.0 : 0.4,
//                 ),
//                 shape: BoxShape.circle,
//               ),
//             );
//           }),
//         ),
//       ],
//     );
//   }
//
//   // -----------------------------------------------
//   // WELCOME TEXT
//   // -----------------------------------------------
//   Widget _buildWelcomeText() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Welcome Back 👋',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.w700,
//             color: Colors.black87,
//           ),
//         ),
//         const SizedBox(height: 6),
//         Text(
//           'Login to your account to continue',
//           style: TextStyle(
//             fontSize: 13,
//             color: Colors.grey.shade500,
//           ),
//         ),
//       ],
//     );
//   }
//
//   // -----------------------------------------------
//   // FIELD LABEL
//   // -----------------------------------------------
//   Widget _buildLabel(String text) {
//     return Text(
//       text,
//       style: const TextStyle(
//         fontSize: 13,
//         fontWeight: FontWeight.w500,
//         color: Colors.black87,
//       ),
//     );
//   }
//
//   // -----------------------------------------------
//   // PASSWORD HEADER
//   // -----------------------------------------------
//   Widget _buildPasswordHeader() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _buildLabel('Password'),
//         TextButton(
//           onPressed: _handleForgotPassword,
//           style: TextButton.styleFrom(
//             padding: EdgeInsets.zero,
//             minimumSize: Size.zero,
//             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//           ),
//           child: const Text(
//             'Forgot Password?',
//             style: TextStyle(
//               fontSize: 13,
//               color: primaryBlue,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   // -----------------------------------------------
//   // EMAIL FIELD
//   // -----------------------------------------------
//   Widget _buildEmailField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextFormField(
//           controller: _emailController,
//           focusNode: _emailFocus,
//           keyboardType: TextInputType.emailAddress,
//           textInputAction: TextInputAction.next,
//           style: const TextStyle(fontSize: 14, color: Colors.black87),
//           onChanged: (value) {
//             // Live validation after field is touched
//             if (_emailTouched) setState(() {});
//           },
//           onFieldSubmitted: (_) {
//             _emailTouched = true;
//             FocusScope.of(context).requestFocus(_passwordFocus);
//           },
//           decoration: _inputDecoration(
//             hint: 'Enter your email',
//             prefixIcon: Icons.email_outlined,
//             isValid: _emailTouched && _isEmailValid,
//             hasError: _emailTouched &&
//                 _validateEmail(_emailController.text) != null,
//           ),
//           validator: _validateEmail,
//         ),
//
//         // ---- Live email hint ----
//         if (_emailController.text.isNotEmpty &&
//             !_emailController.text.contains('@'))
//           Padding(
//             padding: const EdgeInsets.only(top: 6, left: 4),
//             child: Row(
//               children: [
//                 Icon(Icons.info_outline,
//                     size: 12, color: Colors.orange.shade400),
//                 const SizedBox(width: 4),
//                 Text(
//                   'Email must contain @ symbol',
//                   style: TextStyle(
//                     fontSize: 11,
//                     color: Colors.orange.shade400,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//       ],
//     );
//   }
//
//   // -----------------------------------------------
//   // PASSWORD FIELD
//   // -----------------------------------------------
//   Widget _buildPasswordField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextFormField(
//           controller: _passwordController,
//           focusNode: _passwordFocus,
//           obscureText: !_isPasswordVisible,
//           textInputAction: TextInputAction.done,
//           onChanged: (value) {
//             if (_passwordTouched) setState(() {});
//           },
//           onFieldSubmitted: (_) {
//             _passwordTouched = true;
//             _handleLogin();
//           },
//           style: const TextStyle(fontSize: 14, color: Colors.black87),
//           decoration: _inputDecoration(
//             hint: 'Enter your password',
//             prefixIcon: Icons.lock_outline,
//             isValid: _passwordTouched && _isPasswordValid,
//             hasError: _passwordTouched &&
//                 _validatePassword(_passwordController.text) != null,
//             suffixIcon: IconButton(
//               icon: Icon(
//                 _isPasswordVisible
//                     ? Icons.visibility_outlined
//                     : Icons.visibility_off_outlined,
//                 color: Colors.grey.shade400,
//                 size: 20,
//               ),
//               onPressed: () =>
//                   setState(() => _isPasswordVisible = !_isPasswordVisible),
//             ),
//           ),
//           validator: _validatePassword,
//         ),
//
//         // ---- Password strength indicator ----
//         if (_passwordController.text.isNotEmpty) ...[
//           const SizedBox(height: 10),
//           _buildPasswordStrength(),
//         ],
//       ],
//     );
//   }
//
//   // -----------------------------------------------
//   // PASSWORD STRENGTH INDICATOR
//   // -----------------------------------------------
//   Widget _buildPasswordStrength() {
//     final password = _passwordController.text;
//     int strength = 0;
//     String label = '';
//     Color color = Colors.red;
//
//     if (password.length >= 6) strength++;
//     if (password.length >= 10) strength++;
//     if (RegExp(r'[A-Z]').hasMatch(password)) strength++;
//     if (RegExp(r'[0-9]').hasMatch(password)) strength++;
//     if (RegExp(r'[!@#\$&*~%^]').hasMatch(password)) strength++;
//
//     if (strength <= 1) {
//       label = 'Weak';
//       color = errorRed;
//     } else if (strength <= 3) {
//       label = 'Medium';
//       color = Colors.orange;
//     } else {
//       label = 'Strong';
//       color = successGreen;
//     }
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             ...List.generate(5, (index) {
//               return Expanded(
//                 child: Container(
//                   margin: const EdgeInsets.only(right: 4),
//                   height: 4,
//                   decoration: BoxDecoration(
//                     color: index < strength
//                         ? color
//                         : Colors.grey.shade200,
//                     borderRadius: BorderRadius.circular(2),
//                   ),
//                 ),
//               );
//             }),
//             const SizedBox(width: 8),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 11,
//                 color: color,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 6),
//         // Password rules checklist
//         _buildPasswordRule(
//           'At least 6 characters',
//           password.length >= 6,
//         ),
//         _buildPasswordRule(
//           'No spaces allowed',
//           !password.contains(' '),
//         ),
//         _buildPasswordRule(
//           'Contains a number (recommended)',
//           RegExp(r'[0-9]').hasMatch(password),
//         ),
//         _buildPasswordRule(
//           'Contains uppercase letter (recommended)',
//           RegExp(r'[A-Z]').hasMatch(password),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPasswordRule(String rule, bool passed) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 3),
//       child: Row(
//         children: [
//           Icon(
//             passed ? Icons.check_circle : Icons.radio_button_unchecked,
//             size: 13,
//             color: passed ? successGreen : Colors.grey.shade400,
//           ),
//           const SizedBox(width: 6),
//           Text(
//             rule,
//             style: TextStyle(
//               fontSize: 11,
//               color: passed ? successGreen : Colors.grey.shade400,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // -----------------------------------------------
//   // VALIDATION SUMMARY
//   // -----------------------------------------------
//   Widget _buildValidationSummary() {
//     final emailError    = _validateEmail(_emailController.text);
//     final passwordError = _validatePassword(_passwordController.text);
//
//     final bool showEmailError    = _emailTouched && emailError != null;
//     final bool showPasswordError = _passwordTouched && passwordError != null;
//
//     if (!showEmailError && !showPasswordError) return const SizedBox.shrink();
//
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: errorRed.withOpacity(0.05),
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: errorRed.withOpacity(0.2)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Row(
//             children: [
//               Icon(Icons.error_outline, color: errorRed, size: 16),
//               SizedBox(width: 6),
//               Text(
//                 'Please fix the following:',
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w600,
//                   color: errorRed,
//                 ),
//               ),
//             ],
//           ),
//           if (showEmailError) ...[
//             const SizedBox(height: 6),
//             Row(
//               children: [
//                 const SizedBox(width: 22),
//                 const Text(
//                   '• ',
//                   style: TextStyle(color: errorRed, fontSize: 12),
//                 ),
//                 Expanded(
//                   child: Text(
//                     emailError,
//                     style: const TextStyle(
//                       color: errorRed,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//           if (showPasswordError) ...[
//             const SizedBox(height: 4),
//             Row(
//               children: [
//                 const SizedBox(width: 22),
//                 const Text(
//                   '• ',
//                   style: TextStyle(color: errorRed, fontSize: 12),
//                 ),
//                 Expanded(
//                   child: Text(
//                     passwordError,
//                     style: const TextStyle(
//                       color: errorRed,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ],
//       ),
//     );
//   }
//
//   // -----------------------------------------------
//   // INPUT DECORATION HELPER
//   // -----------------------------------------------
//   InputDecoration _inputDecoration({
//     required String hint,
//     required IconData prefixIcon,
//     bool isValid   = false,
//     bool hasError  = false,
//     Widget? suffixIcon,
//   }) {
//     Color borderColor = Colors.grey.shade200;
//     if (isValid)   borderColor = successGreen;
//     if (hasError)  borderColor = errorRed;
//
//     return InputDecoration(
//       hintText: hint,
//       hintStyle: TextStyle(
//         color: Colors.grey.shade400,
//         fontSize: 13,
//       ),
//       prefixIcon: Icon(
//         prefixIcon,
//         color: isValid
//             ? successGreen
//             : hasError
//             ? errorRed
//             : Colors.grey.shade400,
//         size: 20,
//       ),
//       suffixIcon: suffixIcon ??
//           (isValid
//               ? const Icon(
//             Icons.check_circle,
//             color: successGreen,
//             size: 20,
//           )
//               : hasError
//               ? const Icon(
//             Icons.cancel,
//             color: errorRed,
//             size: 20,
//           )
//               : null),
//       filled: true,
//       fillColor: isValid
//           ? successGreen.withOpacity(0.03)
//           : hasError
//           ? errorRed.withOpacity(0.03)
//           : Colors.grey.shade50,
//       contentPadding: const EdgeInsets.symmetric(
//         horizontal: 16,
//         vertical: 16,
//       ),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: BorderSide(color: borderColor),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: BorderSide(color: borderColor),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: BorderSide(
//           color: isValid ? successGreen : primaryBlue,
//           width: 1.5,
//         ),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: const BorderSide(color: errorRed),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: const BorderSide(color: errorRed, width: 1.5),
//       ),
//       errorStyle: const TextStyle(
//         fontSize: 11,
//         color: errorRed,
//       ),
//     );
//   }
//
//   // -----------------------------------------------
//   // LOGIN BUTTON
//   // -----------------------------------------------
//   Widget _buildLoginButton() {
//     return SizedBox(
//       width: double.infinity,
//       height: 52,
//       child: TextButton(
//         onPressed: _isLoading ? null : _handleLogin,
//         style: TextButton.styleFrom(
//           backgroundColor: primaryBlue,
//           foregroundColor: Colors.white,
//           disabledBackgroundColor: primaryBlue.withOpacity(0.5),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         child: _isLoading
//             ? const SizedBox(
//           width: 22,
//           height: 22,
//           child: CircularProgressIndicator(
//             color: Colors.white,
//             strokeWidth: 2.5,
//           ),
//         )
//             : const Text(
//           'Login',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             letterSpacing: 0.8,
//           ),
//         ),
//       ),
//     );
//   }
//
//   // -----------------------------------------------
//   // SIGN UP ROW
//   // -----------------------------------------------
//   Widget _buildSignUpRow() {
//     return Center(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "Don't have an account? ",
//             style: TextStyle(
//               fontSize: 13,
//               color: Colors.grey.shade500,
//             ),
//           ),
//           TextButton(
//             onPressed: () {},
//             style: TextButton.styleFrom(
//               padding: EdgeInsets.zero,
//               minimumSize: Size.zero,
//               tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//             ),
//             child: const Text(
//               'Sign Up',
//               style: TextStyle(
//                 fontSize: 13,
//                 color: primaryBlue,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }






import 'package:basic_auth_navigation_app/features/home/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController    = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocus    = FocusNode();
  final _passwordFocus = FocusNode();

  bool _isPasswordVisible = false;
  bool _isLoading         = false;

  bool _emailTouched    = false;
  bool _passwordTouched = false;

  // -----------------------------------------------
  // DUMMY CREDENTIALS  ← only change needed
  // -----------------------------------------------
  static const String _dummyEmail    = 'user@example.com';
  static const String _dummyPassword = 'Pass1234';

  static const Color primaryBlue  = Color(0xFF1B2FC2);
  static const Color errorRed     = Color(0xFFE53935);
  static const Color successGreen = Color(0xFF43A047);

  @override
  void initState() {
    super.initState();
    _emailFocus.addListener(() {
      if (!_emailFocus.hasFocus && !_emailTouched) {
        setState(() => _emailTouched = true);
      }
    });
    _passwordFocus.addListener(() {
      if (!_passwordFocus.hasFocus && !_passwordTouched) {
        setState(() => _passwordTouched = true);
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  // -----------------------------------------------
  // VALIDATION HELPERS
  // -----------------------------------------------
  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email address is required';
    }
    if (value.trim().length < 5) {
      return 'Email is too short';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }
    if (value.contains('..')) {
      return 'Email cannot contain consecutive dots';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (value.length > 50) {
      return 'Password is too long';
    }
    if (value.contains(' ')) {
      return 'Password cannot contain spaces';
    }
    return null;
  }

  bool get _isEmailValid =>
      _validateEmail(_emailController.text) == null &&
          _emailController.text.isNotEmpty;

  bool get _isPasswordValid =>
      _validatePassword(_passwordController.text) == null &&
          _passwordController.text.isNotEmpty;

  // -----------------------------------------------
  // LOGIN HANDLER  ← credential check added here
  // -----------------------------------------------
  Future<void> _handleLogin() async {
    setState(() {
      _emailTouched    = true;
      _passwordTouched = true;
    });

    FocusScope.of(context).unfocus();

    // Step 1: format validation
    if (!_formKey.currentState!.validate()) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Row(
              children: [
                Icon(Icons.error_outline, color: Colors.white, size: 20),
                SizedBox(width: 10),
                Text('Please fix the errors below'),
              ],
            ),
            backgroundColor: errorRed,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }
      return;
    }

    // Step 2: credential check against dummy account
    final enteredEmail    = _emailController.text.trim();
    final enteredPassword = _passwordController.text;

    if (enteredEmail != _dummyEmail || enteredPassword != _dummyPassword) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Row(
              children: [
                Icon(Icons.lock_outline, color: Colors.white, size: 20),
                SizedBox(width: 10),
                Text('Incorrect email or password'),
              ],
            ),
            backgroundColor: errorRed,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }
      return; // stay on login screen
    }

    // Step 3: credentials match — simulate API delay then navigate
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);

    if (mounted) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              HomeScreen(userEmail: enteredEmail),
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              )),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 400),
        ),
      );
    }
  }

  // -----------------------------------------------
  // FORGOT PASSWORD HANDLER
  // -----------------------------------------------
  void _handleForgotPassword() {
    final forgotEmailController = TextEditingController(
      text: _emailController.text,
    );
    final forgotFormKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Forgot Password?',
          style: TextStyle(
            color: primaryBlue,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Form(
          key: forgotFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Enter your email and we will send a reset link.',
                style: TextStyle(color: Colors.black54, fontSize: 13),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: forgotEmailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 13,
                  ),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.grey.shade400,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: primaryBlue,
                      width: 1.5,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: errorRed),
                  ),
                ),
                validator: _validateEmail,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (forgotFormKey.currentState!.validate()) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Row(
                      children: [
                        Icon(Icons.check_circle_outline,
                            color: Colors.white, size: 20),
                        SizedBox(width: 10),
                        Text('Password reset link sent!'),
                      ],
                    ),
                    backgroundColor: successGreen,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryBlue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Send Link'),
          ),
        ],
      ),
    );
  }

  // -----------------------------------------------
  // BUILD
  // -----------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Center(child: _buildLogo()),
                  const SizedBox(height: 40),
                  _buildWelcomeText(),
                  const SizedBox(height: 32),
                  _buildLabel('Email Address'),
                  const SizedBox(height: 8),
                  _buildEmailField(),
                  const SizedBox(height: 20),
                  _buildPasswordHeader(),
                  const SizedBox(height: 8),
                  _buildPasswordField(),
                  const SizedBox(height: 12),
                  _buildValidationSummary(),
                  const SizedBox(height: 24),
                  _buildLoginButton(),
                  const SizedBox(height: 40),
                  _buildSignUpRow(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // -----------------------------------------------
  // LOGO
  // -----------------------------------------------
  Widget _buildLogo() {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: primaryBlue.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.lock_outline_rounded,
            color: primaryBlue,
            size: 34,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'cignifi',
          style: TextStyle(
            color: primaryBlue,
            fontSize: 28,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: index == 2 ? 7 : 5,
              height: index == 2 ? 7 : 5,
              decoration: BoxDecoration(
                color: primaryBlue.withOpacity(index == 2 ? 1.0 : 0.4),
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ],
    );
  }

  // -----------------------------------------------
  // WELCOME TEXT
  // -----------------------------------------------
  Widget _buildWelcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Welcome Back 👋',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Login to your account to continue',
          style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildPasswordHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLabel('Password'),
        TextButton(
          onPressed: _handleForgotPassword,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            'Forgot Password?',
            style: TextStyle(
              fontSize: 13,
              color: primaryBlue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  // -----------------------------------------------
  // EMAIL FIELD
  // -----------------------------------------------
  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _emailController,
          focusNode: _emailFocus,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
          onChanged: (value) {
            if (_emailTouched) setState(() {});
          },
          onFieldSubmitted: (_) {
            _emailTouched = true;
            FocusScope.of(context).requestFocus(_passwordFocus);
          },
          decoration: _inputDecoration(
            hint: 'Enter your email',
            prefixIcon: Icons.email_outlined,
            isValid: _emailTouched && _isEmailValid,
            hasError: _emailTouched &&
                _validateEmail(_emailController.text) != null,
          ),
          validator: _validateEmail,
        ),
        if (_emailController.text.isNotEmpty &&
            !_emailController.text.contains('@'))
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 4),
            child: Row(
              children: [
                Icon(Icons.info_outline,
                    size: 12, color: Colors.orange.shade400),
                const SizedBox(width: 4),
                Text(
                  'Email must contain @ symbol',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.orange.shade400,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  // -----------------------------------------------
  // PASSWORD FIELD
  // -----------------------------------------------
  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _passwordController,
          focusNode: _passwordFocus,
          obscureText: !_isPasswordVisible,
          textInputAction: TextInputAction.done,
          onChanged: (value) {
            if (_passwordTouched) setState(() {});
          },
          onFieldSubmitted: (_) {
            _passwordTouched = true;
            _handleLogin();
          },
          style: const TextStyle(fontSize: 14, color: Colors.black87),
          decoration: _inputDecoration(
            hint: 'Enter your password',
            prefixIcon: Icons.lock_outline,
            isValid: _passwordTouched && _isPasswordValid,
            hasError: _passwordTouched &&
                _validatePassword(_passwordController.text) != null,
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: Colors.grey.shade400,
                size: 20,
              ),
              onPressed: () =>
                  setState(() => _isPasswordVisible = !_isPasswordVisible),
            ),
          ),
          validator: _validatePassword,
        ),
        if (_passwordController.text.isNotEmpty) ...[
          const SizedBox(height: 10),
          _buildPasswordStrength(),
        ],
      ],
    );
  }

  // -----------------------------------------------
  // PASSWORD STRENGTH
  // -----------------------------------------------
  Widget _buildPasswordStrength() {
    final password = _passwordController.text;
    int strength = 0;
    String label = '';
    Color color = Colors.red;

    if (password.length >= 6) strength++;
    if (password.length >= 10) strength++;
    if (RegExp(r'[A-Z]').hasMatch(password)) strength++;
    if (RegExp(r'[0-9]').hasMatch(password)) strength++;
    if (RegExp(r'[!@#\$&*~%^]').hasMatch(password)) strength++;

    if (strength <= 1) {
      label = 'Weak';
      color = errorRed;
    } else if (strength <= 3) {
      label = 'Medium';
      color = Colors.orange;
    } else {
      label = 'Strong';
      color = successGreen;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ...List.generate(5, (index) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 4),
                  height: 4,
                  decoration: BoxDecoration(
                    color: index < strength
                        ? color
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              );
            }),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        _buildPasswordRule('At least 6 characters', password.length >= 6),
        _buildPasswordRule('No spaces allowed', !password.contains(' ')),
        _buildPasswordRule(
            'Contains a number (recommended)',
            RegExp(r'[0-9]').hasMatch(password)),
        _buildPasswordRule(
            'Contains uppercase letter (recommended)',
            RegExp(r'[A-Z]').hasMatch(password)),
      ],
    );
  }

  Widget _buildPasswordRule(String rule, bool passed) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Row(
        children: [
          Icon(
            passed ? Icons.check_circle : Icons.radio_button_unchecked,
            size: 13,
            color: passed ? successGreen : Colors.grey.shade400,
          ),
          const SizedBox(width: 6),
          Text(
            rule,
            style: TextStyle(
              fontSize: 11,
              color: passed ? successGreen : Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }

  // -----------------------------------------------
  // VALIDATION SUMMARY
  // -----------------------------------------------
  Widget _buildValidationSummary() {
    final emailError    = _validateEmail(_emailController.text);
    final passwordError = _validatePassword(_passwordController.text);

    final bool showEmailError    = _emailTouched && emailError != null;
    final bool showPasswordError = _passwordTouched && passwordError != null;

    if (!showEmailError && !showPasswordError) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: errorRed.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: errorRed.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.error_outline, color: errorRed, size: 16),
              SizedBox(width: 6),
              Text(
                'Please fix the following:',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: errorRed,
                ),
              ),
            ],
          ),
          if (showEmailError) ...[
            const SizedBox(height: 6),
            Row(
              children: [
                const SizedBox(width: 22),
                const Text('• ',
                    style: TextStyle(color: errorRed, fontSize: 12)),
                Expanded(
                  child: Text(
                    emailError,
                    style: const TextStyle(color: errorRed, fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
          if (showPasswordError) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                const SizedBox(width: 22),
                const Text('• ',
                    style: TextStyle(color: errorRed, fontSize: 12)),
                Expanded(
                  child: Text(
                    passwordError,
                    style: const TextStyle(color: errorRed, fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  // -----------------------------------------------
  // INPUT DECORATION HELPER
  // -----------------------------------------------
  InputDecoration _inputDecoration({
    required String hint,
    required IconData prefixIcon,
    bool isValid  = false,
    bool hasError = false,
    Widget? suffixIcon,
  }) {
    Color borderColor = Colors.grey.shade200;
    if (isValid)  borderColor = successGreen;
    if (hasError) borderColor = errorRed;

    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
      prefixIcon: Icon(
        prefixIcon,
        color: isValid
            ? successGreen
            : hasError
            ? errorRed
            : Colors.grey.shade400,
        size: 20,
      ),
      suffixIcon: suffixIcon ??
          (isValid
              ? const Icon(Icons.check_circle, color: successGreen, size: 20)
              : hasError
              ? const Icon(Icons.cancel, color: errorRed, size: 20)
              : null),
      filled: true,
      fillColor: isValid
          ? successGreen.withOpacity(0.03)
          : hasError
          ? errorRed.withOpacity(0.03)
          : Colors.grey.shade50,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: isValid ? successGreen : primaryBlue,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: errorRed),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: errorRed, width: 1.5),
      ),
      errorStyle: const TextStyle(fontSize: 11, color: errorRed),
    );
  }

  // -----------------------------------------------
  // LOGIN BUTTON
  // -----------------------------------------------
  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: TextButton(
        onPressed: _isLoading ? null : _handleLogin,
        style: TextButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          disabledBackgroundColor: primaryBlue.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: _isLoading
            ? const SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2.5,
          ),
        )
            : const Text(
          'Login',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
          ),
        ),
      ),
    );
  }

  // -----------------------------------------------
  // SIGN UP ROW
  // -----------------------------------------------
  Widget _buildSignUpRow() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account? ",
            style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 13,
                color: primaryBlue,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}