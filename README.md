# DOCUMENTO DE LA ACTIVIDAD ESTA EN EL REPOSITORIO SE LLAMA transferencia_hibridas.pdf


# 📱 Barber Shop App — Flutter + Firebase + API + Carrito + Storage Local

Aplicación móvil híbrida desarrollada en **Flutter**, con integración de **Firebase Authentication**, consumo de una **API pública (Fake Store API)**, gestión de estado con **Provider**, y persistencia local con **SharedPreferences**.  
El proyecto está diseñado como un entregable académico bajo la metodología **ABP (Aprendizaje Basado en Proyectos)**, y funciona tanto en **Android** como en **iOS**.

---

## ✨ Características principales
- 🔐 **Autenticación** de usuarios con **Firebase Auth** (email/contraseña).
- 🛒 **Carrito de compras** dinámico con `Provider`.
- 🌐 **Consumo de API pública** (**Fake Store API**) para mostrar productos reales.
- 💾 **Persistencia local** con **SharedPreferences** (token de sesión y carrito).
- 📲 **Compatibilidad multiplataforma** (Android/iOS).
- 🧪 **Pruebas funcionales** documentadas con casos de uso.

---

## 🧰 Requisitos previos
- Flutter **3.19+**
- Cuenta de [Firebase](https://firebase.google.com)
- Android Studio o Xcode instalado

---

## 🚀 Instalación y configuración

1. **Clona el repositorio**:
   ```bash
   git clone https://github.com/camilo-val/barber_shop_app.git
   cd barber_shop_app
   ```

2. **Configura Firebase**:
   - Entra a [Firebase Console](https://console.firebase.google.com) y crea un proyecto `barber_shop_app`.
   - Habilita **Authentication > Email/Password**.
   - Crea app Android (`com.barber.shop`) y coloca `google-services.json` en `android/app/`.
   - Crea app iOS (`com.barber.shop`) y coloca `GoogleService-Info.plist` en `ios/Runner/`.

3. **Instala dependencias y genera configuración**:
   ```bash
   flutter pub add firebase_core firebase_auth provider shared_preferences http
   flutterfire configure
   ```

   Esto generará `lib/firebase_options.dart`.  
   Si no usas `flutterfire configure`, inicializa manualmente con `Firebase.initializeApp()`.

4. **Ejecuta la app**:
   ```bash
   flutter pub get
   flutter run
   ```

5. **Prueba el login/registro**:
   - Crea un usuario en Firebase Console o utiliza la pantalla de **Registro** en la app.

---

## 📂 Estructura del proyecto
```
lib/
 ├─ main.dart                # Punto de entrada
 ├─ firebase_options.dart    # Configuración de Firebase (autogenerado)
 ├─ models/
 │   └─ product.dart         # Modelo de producto
 ├─ providers/
 │   ├─ auth_provider.dart   # Gestión de autenticación
 │   └─ cart_provider.dart   # Gestión del carrito
 ├─ services/
 │   └─ product_api.dart     # Consumo de API Fake Store
 └─ screens/
     ├─ auth_gate.dart       # Control de sesión
     ├─ login_screen.dart    # Pantalla de login
     ├─ register_screen.dart # Pantalla de registro
     ├─ products_screen.dart # Catálogo de productos
     └─ cart_screen.dart     # Carrito de compras
```

---

## 🧪 Casos de prueba funcionales
Ejemplos de pruebas implementadas:

| ID   | Funcionalidad       | Acción del usuario          | Resultado esperado                 | Estado |
|------|--------------------|----------------------------|------------------------------------|--------|
| P01  | Registro           | Ingresar email y password  | Usuario creado en Firebase         | ✅ |
| P02  | Login válido       | Ingresar credenciales      | Acceso y redirección a catálogo    | ✅ |
| P04  | Listar productos   | Abrir catálogo             | Carga desde Fake Store API         | ✅ |
| P05  | Agregar al carrito | Seleccionar producto       | Producto aparece en el carrito     | ✅ |
| P08  | Persistencia       | Cerrar y reabrir app       | Carrito y sesión restaurados       | ✅ |

---

## 🛠️ Tecnologías utilizadas
- [Flutter](https://flutter.dev)  
- [Firebase Authentication](https://firebase.google.com/docs/auth)  
- [Provider](https://pub.dev/packages/provider)  
- [SharedPreferences](https://pub.dev/packages/shared_preferences)  
- [Fake Store API](https://fakestoreapi.com)  

---

## 📄 Licencia
Este proyecto es de uso académico. Puedes modificarlo y adaptarlo libremente para tus propios fines de aprendizaje.
