import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jossy_kitchen/core/constants/colors.dart';
import 'package:jossy_kitchen/core/routes/app_pages.dart';

class LetKnowYou extends StatefulWidget {
  const LetKnowYou({super.key});

  @override
  State<LetKnowYou> createState() => _LetKnowYouState();
}

class _LetKnowYouState extends State<LetKnowYou> {
final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _age;
  String? _gender;
  String? _location;
  String? _profileImagePath;

  final List<String> _ages = List.generate(100, (index) => (index + 1).toString());
  final List<String> _genders = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Let know you better",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 22,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w900,
                    
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(_nameController, "Full Name"),
                _buildTextField(_phoneController, "Phone Number", keyboardType: TextInputType.phone),
                _buildTextField(_emailController, "Email Address", keyboardType: TextInputType.emailAddress),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: _buildDropdown("Age", _ages, _age, (value) => setState(() => _age = value))),
                    const SizedBox(width: 10),
                    Expanded(child: _buildDropdown("Gender", _genders, _gender, (value) => setState(() => _gender = value))),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    // Dummy location picker
                    setState(() => _location = "Sample Location");
                  },
                  icon: const Icon(Icons.location_on),
                  label: const Text("Set Location"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.red),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    // Pick image logic

                  },
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: const Icon(Icons.add, color: AppColors.primary, size: 30),
                  ),
                ),
                const SizedBox(height: 8),
                const Text("Upload Profile Picture", textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   // Submit logic here
                      
                    // }
                    Get.toNamed(Routes.home);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.red),
                  child: const Text("Done", style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    // Privacy policy logic
                    
                  },
                  child: const Text("How safe is my information?", style: TextStyle(color: Colors.white70)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, {TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(70.0)),
        ),
        validator: (value) => value == null || value.isEmpty ? "Please enter $hint" : null,
      ),
    );
  }

  Widget _buildDropdown(String hint, List<String> items, String? value, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      value: value,
      hint: Text(hint),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
      items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      onChanged: onChanged,
      validator: (value) => value == null ? "Please select $hint" : null,
    );
  }
}
