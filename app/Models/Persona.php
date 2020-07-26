<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Persona
 * 
 * @property int $idPersona
 * @property string|null $descripcion
 * @property string|null $telefonoLocal
 * @property string|null $telefonoCelular
 * @property string|null $observacion
 * @property int $idTipoPersona
 * @property string $documento
 * @property string|null $correo
 * @property int $sexo
 * @property Carbon|null $fechaNacimiento
 * @property string|null $direccion
 * @property int|null $idMunicipio
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property TipoPersona $tipo_persona
 * @property Collection|PersonaCliente[] $persona_clientes
 * @property Collection|PersonaProveedor[] $persona_proveedors
 * @property Collection|PersonaVendedor[] $persona_vendedors
 *
 * @package App\Models
 */
class Persona extends Model
{
	protected $table = 'persona';
	protected $primaryKey = 'idPersona';
	public $timestamps = false;

	protected $casts = [
		'idTipoPersona' => 'int',
		'sexo' => 'int',
		'idMunicipio' => 'int',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaNacimiento',
		'fechaCreacion'
	];

	protected $fillable = [
		'descripcion',
		'telefonoLocal',
		'telefonoCelular',
		'observacion',
		'idTipoPersona',
		'documento',
		'correo',
		'sexo',
		'fechaNacimiento',
		'direccion',
		'idMunicipio',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function tipo_persona()
	{
		return $this->belongsTo(TipoPersona::class, 'idTipoPersona');
	}

	public function persona_clientes()
	{
		return $this->hasMany(PersonaCliente::class, 'idPersona');
	}

	public function persona_proveedors()
	{
		return $this->hasMany(PersonaProveedor::class, 'idPersona');
	}

	public function persona_vendedors()
	{
		return $this->hasMany(PersonaVendedor::class, 'idPersona');
	}
}
