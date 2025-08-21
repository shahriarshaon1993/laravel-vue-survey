import { createApp } from "vue";
import Store from "./store";
import Router from "./router";
import App from "./App.vue";
import "./plugins/chart.js";

import "./style.css";

createApp(App).use(Store).use(Router).mount("#app");
