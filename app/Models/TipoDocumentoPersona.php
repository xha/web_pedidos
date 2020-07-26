<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class TipoDocumentoPersona
 * 
 * @property int $idTipoDocumentoPersona
 * @property string|null $descripcion
 * @property string|null $abreviado
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 *
 * @package App\Models
 */
class TipoDocumentoPersona extends Model
{
	protected $table = 'tipo_documento_persona';
	protected $primaryKey = 'idTipoDocumentoPersona';
	public $timestamps = false;

	protected $casts = [
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'descripcion',
		'abreviado',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];
}
