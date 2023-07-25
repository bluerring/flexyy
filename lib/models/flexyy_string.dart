const String mainCollectionText = "main";
const String musclesText = "muscles";
const String nameText = "name";
const String imageLinkText = "image link";
const String exercisesText = "exercises";
const String instructionText = "instruction";
const String difficultyText = "difficulty";
const String equipementText = "equipement";
const String muscleTargetedText = "muscle targeted";
const String workoutsText = "workouts";
const String recipeApiText = "/api/recipes/v2";
const String dietListText = "diet list";
const String caloriesText = "calories";
const String proteinText = "protein";
const String carbohydratesText = "carbohydrates";
const String fatsText = "fats";
const String descriptionText = "description";
const recipesText = "recipes";
const usersText = "users";
const mealsText = "meals";
const emailText = "email";
const passwordText = "password";
const informationsText = "informations";
const informationsDocText = "informations doc";
const ageText = "age";
const heightText = "height";
const weightText = "weight";
const genderText = "gender";
const setsText = "sets";
const repetitionsText = "repetitions";
const genderMaleText = "Gender.male";
const genderFemaleText = "Gender.female";
const maleText = "male";
const femaleText = "female";
const userIdText = "user id";
const String emailSample = "bombegamer77@gmail.com";
const String passwordSample = "mojang13579";
const String welcomeChampionText = "Welcome Champion";
const String introductoryText =
    "Crush your fitness goals with special workouts and meals just for you";
const String passwordHintText = "Enter your password";
const String emailHintText = "Enter your email";
const loginText = "Login";

const newAroundHereText = "New around here?";
const registerText = "Register";
const alreadyRegisteredText = "Already Registered?";
const pleaseWaitText = "Please Wait";
const okText = "OK";
const confirmPasswordHintText = "Confirm your password";
const profileText = "profile";
const workoutIntroductoryPageText = "Here is your workout list";
const noWorkoutsHintText =
    "Whoops!! it looks like you dont have any workouts in your account right now ;(";
const addWorkoutHintText =
    "Press on the Add workout button to add a workout to your account";
const addWorkoutText = "add Workout";
const enterWorkoutNameText = "enter your workout name";
const enterWorkoutDescriptionText = "enter your workout details";
const addWorkoutMusclesTargetedText = "add the muscles targeted";
const addWorkoutExercisesText =
    "add your workout exercises for the specified muscles";
const enterWorkoutDurationText = "enter your workout duration";
const enterWorkoutRestText = "enter your workout rest duration between sets";
const addYourWorkoutHereText = "Add your workout here";
const searchExercisesText = "Search for an exercise";
const abdominalsText = "abdominals";
const abductorsText = "abductors";
const adductorsText = "adductors";
const bicepsText = 'biceps';
const calvesText = 'calves';
const chestText = 'chest';
const forearmsText = 'forearms';
const glutesText = 'glutes';
const hamstringsText = 'hamstrings';
const latsText = 'lats';
const middleBackText = 'middle_back';
const quadricepsText = 'quadriceps';
const trapsText = 'traps';
const tricepsText = 'triceps';
const unknownText = "Unknown";

// this section is for firebase error codes
const String errorCodeEmailAlreadyExists = "email-already-exists";
const String errorCodeNetworkRequestFailed = "network-request-failed";
const String errorCodeInternalError = "internal-error";
const String errorCodeInvalidEmail = "invalid-email";
const String errorCodeInvalidPassword = "invalid-password";
const String errorCodeUserNotFound = "user-not-found";
const String errorCodeInvalidCredential = "invalid-credential";
const String errorCodeWrongPassword = "wrong-password";
const String errorCodeUserDisableed = "user-disabled";
const String errorCodeCanceled = "canceled";
const String errorCodeUnknown = "unknown";
const String errorCodeObjectNotFound = "object-not-found";
const String errorCodeUnauthenticated = "unauthenticated";
const String errorCodeAborted = "aborted";
const String errorCodeAlreadyExists = "already-exists";
const String errorCodeCancelled = "cancelled";
const String errorCodeDataLoss = "data-loss";
const String errorCodeDeadlineExceeded = "deadline-exceeded";
const String errorCodeFailedPrecondition = "failed-precondition";
const String errorCodeInternal = "internal";
const String errorCodeInvalidArgument = "invalid-argument";
const String errorCodeNotFound = "not-found";
const String errorCodeOutOfRange = "out-of-range";
const String errorCodePermissionDenied = "permission-denied";
const String errorCodeResourceExhausted = "resource-exhausted";
const String errorCodeUnavailable = "unavailable";
const String errorCodeUnimplemented = "unimplemented";

// this section is for error codes for http requests
const String httpsErrorCodeBadRequest = '400';
const String httpsErrorCodeUnauthorized = '401';
const String httpsErrorCodeForbidden = '403';
const String httpsErrorCodeNotFound = '404';
const String httpsErrorCodeMethodNotAllowed = '405';
const String httpsErrorCodeRequestTimeout = '408';
const String httpsErrorCodeConflict = '409';
const String httpsErrorCodeTooManyRequests = '429';

const String httpsErrorCodeInternalError = '500';
const String httpsErrorCodeNotImplemented = '501';
const String httpsErrorCodeBadGateway = '502';
const String httpsErrorCodeServiceUnavailable = '503';
const String httpsErrorCodeGatewayTimeout = '504';
// this section is for the title and content of the errors

const String errorEmailAlreadyExistsTitle = "Email Already Exists";
const String errorEmailAlreadyExistsContent =
    "The provided email address is already associated with an existing user account. Please choose a different email address or try logging in with the existing account.";

const String errorNetworkRequestFailedTitle = "Network Request Failed";
const String errorNetworkRequestFailedContent =
    "A network request failed. Please check your internet connection.";

const String errorInternalErrorTitle = "Internal Error";
const String errorInternalErrorContent =
    "An internal error has occurred while processing your request. Please try again later or contact the support team for assistance.";

const String errorInvalidEmailTitle = "Invalid Email";
const String errorInvalidEmailContent =
    "The provided email address is not in the correct format. Please enter a valid email address (e.g., example@example.com).";

const String errorInvalidPasswordTitle = "Invalid Password";
const String errorInvalidPasswordContent =
    "The provided password is invalid. Please make sure your password meets the required criteria and try again.";

const String errorUserNotFoundTitle = "User Not Found";
const String errorUserNotFoundContent =
    "The user corresponding to the provided email address was not found. Please check your email address or register for a new account.";

const String errorInvalidCredentialTitle = "Invalid Credential";
const String errorInvalidCredentialContent =
    "The provided credential is invalid. Please double-check your login credentials and try again.";

const String errorWrongPasswordTitle = "Wrong Password";
const String errorWrongPasswordContent =
    "The provided password is incorrect for the given email address. Please verify your password and try again.";

const String errorUserDisabledTitle = "User Disabled";
const String errorUserDisabledContent =
    "The user account has been disabled. Please contact the support team for further assistance.";

const String errorCanceledTitle = "Canceled";
const String errorCanceledContent =
    "The operation has been canceled by the user or due to some other reason. Please retry the operation if necessary.";

const String errorUnknownTitle = "Unknown Error";
const String errorUnknownContent =
    "An unknown error has occurred while processing your request. Please try again later or contact the support team for assistance.";

const String errorObjectNotFoundTitle = "Object Not Found";
const String errorObjectNotFoundContent =
    "The requested object or resource was not found. Please verify the information and try again.";

const String errorUnauthenticatedTitle = "Unauthenticated";
const String errorUnauthenticatedContent =
    "The user is not authenticated. Please log in or provide valid authentication credentials to access the requested resource.";

const String errorAbortedTitle = "Operation Aborted";
const String errorAbortedContent = "The operation was aborted.";

const String errorAlreadyExistsTitle = "Already Exists";
const String errorAlreadyExistsContent = "The resource already exists.";

const String errorCancelledTitle = "Operation Cancelled";
const String errorCancelledContent = "The operation was cancelled.";

const String errorInvalidArgumentTitle = "Invalid Argument";
const String errorInvalidArgumentContent = "An invalid argument was provided.";

const String errorNotFoundTitle = "Not Found";
const String errorNotFoundContent = "The requested resource was not found.";

const String errorUnavailableTitle = "Service Unavailable";
const String errorUnavailableContent = "The service is currently unavailable.";

// Client Errors
const String httpsErrorBadRequestTitle = 'Bad Request';
const String httpsErrorBadRequestContent =
    'Oops! Something went wrong with your request. Please check your input and try again.';

// Server Errors
const String httpsErrorInternalServerErrorTitle = 'Internal Server Error';
const String httpsErrorInternalServerErrorContent =
    'Oops! An internal server error has occurred. Please try again later.';

const String httpsErrorServiceUnavailableTitle = 'Service Unavailable';
const String httpsErrorServiceUnavailableContent =
    'The server is currently unavailable. Please try again later.';

const String httpsErrorGatewayTimeoutTitle = 'Gateway Timeout';
const String httpsErrorGatewayTimeoutContent =
    'The server took too long to respond. Please try again later.';
const String randomErrorTitle = "Whoops! Something went wrong";
const String randomErrorContent =
    "It looks like something went wrong .Please try again later.";
