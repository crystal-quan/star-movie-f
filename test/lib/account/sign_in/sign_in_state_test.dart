import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:star_movie_3/ui/account/login/cubit/login_cubit.dart';
import 'package:star_movie_3/ui/account/login/login.dart';

void main() {
  late LoginState state;
  setUp(
    () {
      state = LoginState();
    },
  );
  group(
    'check state initialization ',
    () {
      
      test(
        'state empty return first state',
        () {
          expect(
              LoginState(),
              LoginState(
                  email: Email.pure(),
                  password: Password.pure(),
                  status: FormzStatus.pure,
                  errorMessage: null,
                  id: null));
        },
      );
      test(
        'State.email return pure',
        () {
          expect(state.email, Email.pure());
        },
      );
      test(
        'State.email.valid return invalid',
        () {
          Email invalidEmail=Email.dirty('test invalid.com') ;
          expect(LoginState(email:invalidEmail).email.invalid,true );
        },
      );
      
      test(
        'State.email.valid return valid(true)',
        () {
          Email validEmail=Email.dirty('testinvalid@gmail.com') ;
          expect(LoginState(email:validEmail).email.valid,true);
        },
      );
       test(
        'State.email.error return no has Error (null)',
        () {
          Email noErrorEmail=Email.dirty('test22@gmail.com') ;
          expect(LoginState(email:noErrorEmail).email.error,null );
        },
      );
      test(
        'State.email.error return has Error (EmailValidationError.invalid)',
        () {
          Email hasErrorEmail=Email.dirty('test22gmail.com') ;
          expect(LoginState(email:hasErrorEmail).email.error,EmailValidationError.invalid );
        },
      );

      test(
        'state.Passsword return pure',
        () {
          expect(state.password, Password.pure());
        },
      );
      test(
        'State.Password.valid return valid(true)',
        () {
          Password validPass=Password.dirty('1234asdf') ;
          expect(LoginState(password:validPass).password.valid,true);
        },
      );
       test(
        'State.Password.error return no Error (null)',
        () {
          Password noErrordPass=Password.dirty('1234asdf') ;
          expect(LoginState(password:noErrordPass).password.error,null);
        },
      );
       test(
        'State.Password.error return has Error (Error.invalid)',
        () {
          Password hasErrordPass=Password.dirty('12345678') ;
          expect(LoginState(password:hasErrordPass).password.error,PasswordValidationError.invalid);
        },
      );
       test(
        'State.Password.invalid return invalid',
        () {
          Password invalidPass=Password.dirty('1') ;
          expect(LoginState(password:invalidPass).password.invalid,true);
        },
      );
      test(
        'state.status return pure ',
        () {
          expect(state.status, FormzStatus.pure);
        },
      );
      test(
        'errormessage return null',
        () {
          expect(state.errorMessage, null);
        },
      );
      test(
        'errormessage return String',
        () {
          String errorMessage = 'first Error';
          expect(LoginState(errorMessage: errorMessage).errorMessage,'first Error');
        },
      );

      test(
        'state.id return null',
        () {
          expect(state.id, null);
        },
      );
       test(
        'id return String',
        () {
          String myId = 'my id';
          expect(LoginState(id: myId).id,'my id');
        },
      );
     
      group('creat state.copywith', (() {
        late LoginState state;
        setUp(
          () {
            state = LoginState();
          },
        );
        test('email.copywith return value ', () {
          String value = "test@gmail.com";
          final Email email = Email.dirty(value);
          expect(state.copyWith(email: email).email, Email.dirty('$value'));
          expect(
              state
                  .copyWith(email: email, status: Formz.validate([email]))
                  .status,
              FormzStatus.valid);
        });
        test(
          'email.copywith return Status invalid',
          () {
            String value = "test12gmail.com";
            final Email emailError = Email.dirty(value);

            expect(
                state
                    .copyWith(
                        email: emailError,
                        status: Formz.validate([emailError, state.password]))
                    .status,
                FormzStatus.invalid);
          },
        );
        test(
          'Status.copywith return invalid',
          () {
            final FormzStatus status = FormzStatus.invalid;
            expect(state.copyWith(status: status).status, FormzStatus.invalid);
          },
        );
        test(
          'Status.copywith return valid',
          () {
            final FormzStatus status = FormzStatus.valid;
            expect(state.copyWith(status: status).status, FormzStatus.valid);
          },
        );
        test(
          'Status.copywith return pure',
          () {
            expect(state.copyWith(status: null).status, FormzStatus.pure);
          },
        );
        test(
          'Status.copywith return submissionCanceled',
          () {
            final FormzStatus status = FormzStatus.submissionCanceled;
            expect(state.copyWith(status: status).status,
                FormzStatus.submissionCanceled);
          },
        );
        test(
          'Status.copywith return submissionFailure',
          () {
            final FormzStatus status = FormzStatus.submissionFailure;
            expect(state.copyWith(status: status).status,
                FormzStatus.submissionFailure);
          },
        );
        test(
          'Status.copywith return submissionInProgress',
          () {
            final FormzStatus status = FormzStatus.submissionInProgress;
            expect(state.copyWith(status: status).status,
                FormzStatus.submissionInProgress);
          },
        );
        test(
          'Status.copywith return submissionSuccess',
          () {
            final FormzStatus status = FormzStatus.submissionSuccess;
            expect(state.copyWith(status: status).status,
                FormzStatus.submissionSuccess);
          },
        );
        test(
          'ErrorMessage.copywith return StringError',
          () {
            final String errorMessage = 'has error';
            expect(state.copyWith(errorMessage: errorMessage).errorMessage,
                'has error');
          },
        );
        test(
          'Id.copywith return StringId',
          () {
            final String Id = 'my id';
            expect(state.copyWith(id: Id).id, 'my id');
          },
        );
      }));
    },
  );
}
