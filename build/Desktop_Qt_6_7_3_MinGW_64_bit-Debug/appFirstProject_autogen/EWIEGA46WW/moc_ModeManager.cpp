/****************************************************************************
** Meta object code from reading C++ file 'ModeManager.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.7.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../ModeManager.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ModeManager.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.7.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {

#ifdef QT_MOC_HAS_STRINGDATA
struct qt_meta_stringdata_CLASSModeManagerENDCLASS_t {};
constexpr auto qt_meta_stringdata_CLASSModeManagerENDCLASS = QtMocHelpers::stringData(
    "ModeManager",
    "modeChanged",
    "",
    "progressValueChanged",
    "rightArrowUpdated",
    "leftArrowUpdated",
    "battHealthChanged",
    "speedChanged",
    "newSpeed",
    "arcChanged",
    "handleKeyPress",
    "keyCode",
    "mode",
    "progressValue",
    "rightArrow",
    "leftArrow",
    "battHealth",
    "speed",
    "arc"
);
#else  // !QT_MOC_HAS_STRINGDATA
#error "qtmochelpers.h not found or too old."
#endif // !QT_MOC_HAS_STRINGDATA
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_CLASSModeManagerENDCLASS[] = {

 // content:
      12,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       7,   74, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       7,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   62,    2, 0x06,    8 /* Public */,
       3,    0,   63,    2, 0x06,    9 /* Public */,
       4,    0,   64,    2, 0x06,   10 /* Public */,
       5,    0,   65,    2, 0x06,   11 /* Public */,
       6,    0,   66,    2, 0x06,   12 /* Public */,
       7,    1,   67,    2, 0x06,   13 /* Public */,
       9,    0,   70,    2, 0x06,   15 /* Public */,

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
      10,    1,   71,    2, 0x02,   16 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,    8,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void, QMetaType::Int,   11,

 // properties: name, type, flags
      12, QMetaType::QString, 0x00015103, uint(0), 0,
      13, QMetaType::Int, 0x00015103, uint(1), 0,
      14, QMetaType::Bool, 0x00015103, uint(2), 0,
      15, QMetaType::Bool, 0x00015103, uint(3), 0,
      16, QMetaType::Int, 0x00015103, uint(4), 0,
      17, QMetaType::Int, 0x00015103, uint(5), 0,
      18, QMetaType::Bool, 0x00015103, uint(6), 0,

       0        // eod
};

Q_CONSTINIT const QMetaObject ModeManager::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_CLASSModeManagerENDCLASS.offsetsAndSizes,
    qt_meta_data_CLASSModeManagerENDCLASS,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_CLASSModeManagerENDCLASS_t,
        // property 'mode'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'progressValue'
        QtPrivate::TypeAndForceComplete<int, std::true_type>,
        // property 'rightArrow'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'leftArrow'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'battHealth'
        QtPrivate::TypeAndForceComplete<int, std::true_type>,
        // property 'speed'
        QtPrivate::TypeAndForceComplete<int, std::true_type>,
        // property 'arc'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<ModeManager, std::true_type>,
        // method 'modeChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'progressValueChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'rightArrowUpdated'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'leftArrowUpdated'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'battHealthChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'speedChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        // method 'arcChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'handleKeyPress'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>
    >,
    nullptr
} };

void ModeManager::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<ModeManager *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->modeChanged(); break;
        case 1: _t->progressValueChanged(); break;
        case 2: _t->rightArrowUpdated(); break;
        case 3: _t->leftArrowUpdated(); break;
        case 4: _t->battHealthChanged(); break;
        case 5: _t->speedChanged((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        case 6: _t->arcChanged(); break;
        case 7: _t->handleKeyPress((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (ModeManager::*)();
            if (_t _q_method = &ModeManager::modeChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (ModeManager::*)();
            if (_t _q_method = &ModeManager::progressValueChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (ModeManager::*)();
            if (_t _q_method = &ModeManager::rightArrowUpdated; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (ModeManager::*)();
            if (_t _q_method = &ModeManager::leftArrowUpdated; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (ModeManager::*)();
            if (_t _q_method = &ModeManager::battHealthChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (ModeManager::*)(int );
            if (_t _q_method = &ModeManager::speedChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (ModeManager::*)();
            if (_t _q_method = &ModeManager::arcChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 6;
                return;
            }
        }
    } else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<ModeManager *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->mode(); break;
        case 1: *reinterpret_cast< int*>(_v) = _t->progressValue(); break;
        case 2: *reinterpret_cast< bool*>(_v) = _t->rightArrow(); break;
        case 3: *reinterpret_cast< bool*>(_v) = _t->leftArrow(); break;
        case 4: *reinterpret_cast< int*>(_v) = _t->battHealth(); break;
        case 5: *reinterpret_cast< int*>(_v) = _t->speed(); break;
        case 6: *reinterpret_cast< bool*>(_v) = _t->arc(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<ModeManager *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setMode(*reinterpret_cast< QString*>(_v)); break;
        case 1: _t->setProgressValue(*reinterpret_cast< int*>(_v)); break;
        case 2: _t->setRightArrow(*reinterpret_cast< bool*>(_v)); break;
        case 3: _t->setLeftArrow(*reinterpret_cast< bool*>(_v)); break;
        case 4: _t->setBattHealth(*reinterpret_cast< int*>(_v)); break;
        case 5: _t->setSpeed(*reinterpret_cast< int*>(_v)); break;
        case 6: _t->setArc(*reinterpret_cast< bool*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    } else if (_c == QMetaObject::BindableProperty) {
    }
}

const QMetaObject *ModeManager::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ModeManager::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CLASSModeManagerENDCLASS.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int ModeManager::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 8)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 8;
    }else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    }
    return _id;
}

// SIGNAL 0
void ModeManager::modeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void ModeManager::progressValueChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void ModeManager::rightArrowUpdated()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void ModeManager::leftArrowUpdated()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void ModeManager::battHealthChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void ModeManager::speedChanged(int _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}

// SIGNAL 6
void ModeManager::arcChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}
QT_WARNING_POP
