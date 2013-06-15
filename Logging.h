
#import "DDLog.h"

// First undefine the default stuff we don't want to use.

#undef LOG_LEVEL_ERROR
#undef LOG_LEVEL_WARN
#undef LOG_LEVEL_INFO
#undef LOG_LEVEL_VERBOSE

// Now define everything how we want it

// Define your global log level
#if defined(DEBUG)
#define LOG_LEVEL_FILTER  (LOG_FLAG_ERROR | LOG_FLAG_WARN | LOG_FLAG_INFO | LOG_FLAG_VERBOSE) // all levels
#else 
#define LOG_LEVEL_FILTER  (LOG_FLAG_ERROR | LOG_FLAG_WARN) // all levels except verbose
#endif
//#define LOG_LEVEL_FILTER  (LOG_FLAG_ERROR | LOG_FLAG_WARN | LOG_FLAG_INFO) // all levels except verbose
//#define LOG_LEVEL_FILTER  (LOG_FLAG_ERROR)  // errors only

// Log levels: Specifies the coarse-grained logging capabilities
#define LOG_LEVEL_OFF     0
#define LOG_LEVEL_ERROR   ((LOG_FLAG_ERROR) & LOG_LEVEL_FILTER)                                                    // 0...0001
#define LOG_LEVEL_WARN    ((LOG_FLAG_ERROR | LOG_FLAG_WARN) & LOG_LEVEL_FILTER)                                    // 0...0011
#define LOG_LEVEL_INFO    ((LOG_FLAG_ERROR | LOG_FLAG_WARN | LOG_FLAG_INFO) & LOG_LEVEL_FILTER)                    // 0...0111
#define LOG_LEVEL_VERBOSE ((LOG_FLAG_ERROR | LOG_FLAG_WARN | LOG_FLAG_INFO | LOG_FLAG_VERBOSE) & LOG_LEVEL_FILTER) // 0...1111
