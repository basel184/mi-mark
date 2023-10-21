<template>

	<div class="mt-20">

<MiiNav />
<MiiNavDashboard />

		<Nuxt />
    <slot />
    <IamFooter>
      <p>&copy; 2022 My Company, Inc</p>
    </IamFooter>
	</div>

</template>

<script >

export default{
    auth: false,

}


</script>

