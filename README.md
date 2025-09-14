# Double V Partners - Prueba Técnica

Aplicación Flutter desarrollada como parte de la **prueba técnica para Double V Partners**.  
La app permite **crear, listar y eliminar usuarios**, junto con la gestión de sus direcciones, siguiendo una arquitectura **Clean Architecture + Feature-based**.

---

## 🚀 Tecnologías utilizadas

- **Flutter** (UI & lógica de presentación)
- **Riverpod** (gestión de estado)
- **GoRouter** (navegación declarativa)
- **Hive** (persistencia local)

---

## 🏗️ Arquitectura

El proyecto sigue **Clean Architecture** con organización **feature-based**, donde cada feature es un módulo independiente con sus propias capas:

- **Domain** → Entidades y contratos de negocio (`User`, `Address`)
- **Data** → Modelos persistentes (Hive), mappers y data sources
- **Application** → Lógica de negocio, casos de uso, `Repository` + `StateNotifier`
- **Presentation** → UI (pages, widgets, controladores de formularios)

---

## 📂 Estructura del proyecto

```
lib/
│
├── config/               # Configuración global (navegación, providers, etc.)
├── core/                 # Utilidades y configuraciones generales
├── feature/
│   └── user/             # Módulo de usuarios
│       ├── data/         # Repositorios, mappers y fuentes de datos
│       ├── domain/       # Entidades y casos de uso
│       └── presentation/ # UI, providers y notifiers
├── shared/               # Compartidos
│
└── main.dart             # Punto de entrada de la aplicación
```

---

## ⚙️ Configuración inicial

1. **Clonar el repositorio**
   ```bash
   git clone <repo-url>
   cd double_v_partners_prueba_tecnica
   ```
   
2. **Instalar dependencias**
   ```bash
   fvm flutter pub get
   ```
   
3. **Generar archivos de hive**
   ```bash
   fvm flutter pub run build_runner build --delete-conflicting-outputs
   ```
   
4. **Correr la app**
   ```bash
   fvm flutter run
   ```

---

## ✅ Funcionalidades principales

- **Crear, listar y eliminar usuarios**
- **Gestión de direcciones de un usuario**
- **Persistencia local con Hive**
- **Navegación declarativa con GoRouter**
- **Lógica de negocio con Riverpod**
- **UI con Flutter**

## 🧪 Tests

Se incluyen pruebas unitarias para el UserNotifier.

```bash
fvm flutter test
```