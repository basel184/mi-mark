<template>
  <div>
    <h1 class="text-lg font-bold text-gray-700 leading-tight text-center mt-12 mb-5">Form Wizard - Multi Step Form</h1>
    <form class="p-12 shadow-md rounded-2xl bg-white mx-auto border-solid border-2 border-gray-100 mb-8" @submit.prevent="submitForm">
      <!-- start step indicators -->
      <div class="form-header flex gap-3 mb-4 text-xs text-center">
        <span
          v-for="(step, index) in steps"
          :key="index"
          :class="['stepIndicator', { active: currentStep === index, finish: currentStep > index }]"
        >
          {{ step }}
        </span>
      </div>
      <!-- end step indicators -->

      <!-- step one -->
      <div v-show="currentStep === 0" class="step">
        <p class="text-md text-gray-700 leading-tight text-center mt-8 mb-5">Create your account</p>
        <div class="mb-6">
          <label> zzzzzzzzz</label>
          <input
            type="email"
            placeholder="Email Address"
            v-model="formData.email"
            class="w-full px-4 py-3 rounded-md text-gray-700 font-medium border-solid border-2 border-gray-200"
          />
        </div>
        <div class="mb-6">
          <input
            type="password"
            placeholder="Password"
            v-model="formData.password"
            class="w-full px-4 py-3 rounded-md text-gray-700 font-medium border-solid border-2 border-gray-200"
          />
        </div>
        <div class="mb-6">
          <input
            type="password"
            placeholder="Confirm Password"
            v-model="formData.confirmPassword"
            class="w-full px-4 py-3 rounded-md text-gray-700 font-medium border-solid border-2 border-gray-200"
          />
        </div>
      </div>

      <!-- step two -->
      <div v-show="currentStep === 1" class="step">
        <p class="text-md text-gray-700 leading-tight text-center mt-8 mb-5">Your presence on the social network</p>
        <div class="mb-6">
          <input
            type="text"
            placeholder="Linked In"
            v-model="formData.linkedin"
            class="w-full px-4 py-3 rounded-md text-gray-700 font-medium border-solid border-2 border-gray-200"
          />
        </div>
        <div class="mb-6">
          <input
            type="text"
            placeholder="Twitter"
            v-model="formData.twitter"
            class="w-full px-4 py-3 rounded-md text-gray-700 font-medium border-solid border-2 border-gray-200"
          />
        </div>
        <div class="mb-6">
          <input
            type="text"
            placeholder="Facebook"
            v-model="formData.facebook"
            class="w-full px-4 py-3 rounded-md text-gray-700 font-medium border-solid border-2 border-gray-200"
          />
        </div>
      </div>

      <!-- step three -->
      <div v-show="currentStep === 2" class="step">
        <p class="text-md text-gray-700 leading-tight text-center mt-8 mb-5">We will never sell it</p>
        <div class="mb-6">
          <input
            type="text"
            placeholder="Full name"
            v-model="formData.fullname"
            class="w-full px-4 py-3 rounded-md text-gray-700 font-medium border-solid border-2 border-gray-200"
          />
        </div>
        <div class="mb-6">
          <input
            type="text"
            placeholder="Mobile"
            v-model="formData.mobile"
            class="w-full px-4 py-3 rounded-md text-gray-700 font-medium border-solid border-2 border-gray-200"
          />
        </div>
        <div class="mb-6">
          <input
            type="text"
            placeholder="Address"
            v-model="formData.address"
            class="w-full px-4 py-3I apologize for the incomplete response. To continue with the remaining code:

```vue
          rounded-md text-gray-700 font-medium border-solid border-2 border-gray-200"
        />
      </div>
    </div>

    <!-- step four -->
    <div v-show="currentStep === 3" class="step">
      <p class="text-md text-gray-700 leading-tight text-center mt-8 mb-5">Final step</p>
      <div class="mb-6">
        <textarea
          placeholder="Additional comments"
          v-model="formData.comments"
          class="w-full px-4 py-3 rounded-md text-gray-700 font-medium border-solid border-2 border-gray-200"
        ></textarea>
      </div>
    </div>

    <!-- navigation buttons -->
    <div class="flex justify-between">
      <button
        type="button"
        class="px-4 py-2 rounded-md bg-gray-200 text-gray-700 font-medium"
        :disabled="currentStep === 0"
        @click="previousStep"
      >
        Previous
      </button>
      <button
        type="button"
        class="px-4 py-2 rounded-md bg-gray-200 text-gray-700 font-medium"
        :disabled="currentStep === steps.length - 1"
        @click="nextStep"
      >
        Next
      </button>
      <button
        type="submit"
        v-show="currentStep === steps.length - 1"
        class="px-4 py-2 rounded-md bg-blue-500 text-white font-medium"
      >
        Submit
      </button>
    </div>
  </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      currentStep: 0,
      steps: ["Account", "Social", "Personal", "Final"],
      formData: {
        email: "",
        password: "",
        confirmPassword: "",
        linkedin: "",
        twitter: "",
        facebook: "",
        fullname: "",
        mobile: "",
        address: "",
        comments: "",
      },
    };
  },
  methods: {
    nextStep() {
      if (this.currentStep < this.steps.length - 1) {
        this.currentStep++;
      }
    },
    previousStep() {
      if (this.currentStep > 0) {
        this.currentStep--;
      }
    },
    submitForm() {
      // Handle form submission logic here
      console.log(this.formData);
    },
  },
};
</script>

<style scoped>
.step {
  display: none;
}
.stepIndicator {
  display: inline-block;
  width: 24px;
  height: 24px;
  border-radius: 50%;
  background-color: #ddd;
  line-height: 24px;
  text-align: center;
  font-weight: bold;
}
.stepIndicator.active {
  background-color: #007bff;
  color: #fff;
}
.stepIndicator.finish {
  background-color: #28a745;
}
body{
            font-family: 'Open Sans', sans-serif;
        }
        #signUpForm {
            max-width: 500px;
        }
        #signUpForm .form-header .stepIndicator.active {
            font-weight: 600;
        }
        #signUpForm .form-header .stepIndicator.finish {
            font-weight: 600;
            color: #5a67d8;
        }
        #signUpForm .form-header .stepIndicator::before {
            content: "";
            position: absolute;
            left: 50%;
            bottom: 0;
            transform: translateX(-50%);
            z-index: 9;
            width: 20px;
            height: 20px;
            background-color: #c3dafe;
            border-radius: 50%;
            border: 3px solid #ebf4ff;
        }
        #signUpForm .form-header .stepIndicator.active::before {
            background-color: #a3bffa;
            border: 3px solid #c3dafe;
        }
        #signUpForm .form-header .stepIndicator.finish::before {
            background-color: #5a67d8;
            border: 3px solid #c3dafe;
        }
        #signUpForm .form-header .stepIndicator::after {
            content: "";
            position: absolute;
            left: 50%;
            bottom: 8px;
            width: 100%;
            height: 3px;
            background-color: #f3f3f3;
        }
        #signUpForm .form-header .stepIndicator.active::after {
            background-color: #a3bffa;
        }
        #signUpForm .form-header .stepIndicator.finish::after {
            background-color: #5a67d8;
        }
        #signUpForm .form-header .stepIndicator:last-child:after {
            display: none;
        }
        #signUpForm input.invalid {
            border: 2px solid #ffaba5;
        }
        #signUpForm .step {
          display: none;
        }
</style>
