

---

```markdown
# 📝 Hive To-Do App (Flutter)

A simple and clean **To-Do List App** built with **Flutter** using **Hive** as a local NoSQL database. This app allows users to add, update, delete, and mark tasks as completed — all stored locally on the device.

---

## 📦 Features

- Add new to-do tasks
- Mark tasks as completed/uncompleted
- Delete tasks
- Persistent local storage using Hive
- Lightweight and fast performance

---

## 📸 Screenshots

*(Add screenshots of your app here)*

---

## 🧰 Tech Stack

- Flutter
- Hive
- Hive Flutter Adapter
- Dart

---

## 🏗️ Project Structure

```

lib/
│
├── main.dart
├── model/
│   └── todo\_model.dart
├── services/
│   └── hive\_service.dart
├── pages/
│   └── home\_page.dart
└── widgets/
└── todo\_tile.dart

````

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-username/hive_todo_app.git
cd hive_todo_app
````

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the app

```bash
flutter run
```

---

## 💾 Hive Setup

1. Add dependencies in `pubspec.yaml`:

```yaml
dependencies:
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  path_provider: ^2.1.1
  flutter:
    sdk: flutter
```

2. Initialize Hive in `main.dart`:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todoBox');
  runApp(const MyApp());
}
```

3. Create model using `HiveType` and `HiveField`:

```dart
@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  bool isDone;

  TodoModel({required this.title, required this.isDone});
}
```

---

## ❓ Common Hive Questions

### 🔹 What is Hive?

Hive is a lightweight and fast key-value database written in pure Dart. It works offline and is suitable for Flutter apps that need local storage.

### 🔹 Do I need to use adapters?

Yes, Hive requires you to create a type adapter for custom objects. You can generate them using the `build_runner` package or manually.

### 🔹 Where is the data stored?

Data is stored in a local file on the user's device using the path provided by `path_provider`.

---

## ✅ To-Do

* [ ] Add support for due dates and reminders
* [ ] Add categories or tags
* [ ] Add dark mode
* [ ] Cloud sync (Firebase or Supabase)



## Screenshots
 <div>
    <img src= "https://github.com/user-attachments/assets/c6566928-bd5c-4805-9fa5-2abd4543907e"height =500px>
      <img src= "https://github.com/user-attachments/assets/45ab7e84-034d-4f9a-ae82-7e18b15b1271"height =500px>
     <img src= "https://github.com/user-attachments/assets/a430fbaa-bd44-40b8-9bea-a484e6316a7d"height =500px>
</div>



https://github.com/user-attachments/assets/122c6cb5-68f8-4221-bdad-e82960033cc2



